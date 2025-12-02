import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Position? _pos;
  bool _locReady = false;
  String? _error;

  static const CameraPosition _fallback = CameraPosition(
    target: LatLng(31.9539, 35.9106), // عمّان (fallback)
    zoom: 13,
  );

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _error = "خدمة تحديد الموقع (GPS) غير مفعّلة.";
          _locReady = true;
        });
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        setState(() {
          _error = "تم رفض صلاحية الموقع.";
          _locReady = true;
        });
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _error = "صلاحية الموقع مرفوضة نهائياً. فعّلها من الإعدادات.";
          _locReady = true;
        });
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _pos = pos;
        _locReady = true;
      });

      // حرّك الكاميرا للموقع الحالي إذا الخريطة جاهزة
      if (_controller.isCompleted) {
        final ctrl = await _controller.future;
        await ctrl.animateCamera(
          CameraUpdate.newLatLngZoom(LatLng(pos.latitude, pos.longitude), 16),
        );
      }
    } catch (e) {
      setState(() {
        _error = "تعذر جلب الموقع الحالي.";
        _locReady = true;
      });
    }
  }

  Set<Marker> get _markers {
    if (_pos == null) return {};
    return {
      Marker(
        markerId: const MarkerId("me"),
        position: LatLng(_pos!.latitude, _pos!.longitude),
        infoWindow: const InfoWindow(title: "موقعي الحالي"),
      ),
    };
  }

  CameraPosition get _initialCamera {
    if (_pos == null) return _fallback;
    return CameraPosition(
      target: LatLng(_pos!.latitude, _pos!.longitude),
      zoom: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    // أبعاد الماب: بتتمدّد مع Expanded في الصفحة، بدون 500x500
    if (!_locReady) {
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_error!, textAlign: TextAlign.center),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _initLocation,
                child: const Text("إعادة المحاولة"),
              ),
            ],
          ),
        ),
      );
    }

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _initialCamera,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      markers: _markers,
      onMapCreated: (GoogleMapController controller) async {
        if (!_controller.isCompleted) _controller.complete(controller);

        if (_pos != null) {
          await controller.animateCamera(
            CameraUpdate.newLatLngZoom(LatLng(_pos!.latitude, _pos!.longitude), 16),
          );
        }
      },
    );
  }
}
