// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
