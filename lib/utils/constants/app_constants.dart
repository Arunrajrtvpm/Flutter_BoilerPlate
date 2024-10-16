class Constants {
  static final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final phoneRegex = RegExp(r'^[0-9]{10}$');

  static const String dateFormatWithTime = 'dd/MM/yyyy hh:mm a';
  static const String dateFormatWithoutTime = 'dd/MM/yyyy';
  static const String timeFormat24Hour = 'HH:mm';
  static const String timeFormat12Hour = 'hh:mm a';
}
