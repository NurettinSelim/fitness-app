class WeekHelper {
  static String getWeekdayNameFromNumber(int weekdayNum) {
    return weekdayNames.elementAt(weekdayNum);
  }

  static int weekdayNameToNum(String weekdayName) {
    return weekdayNames.indexOf(weekdayName);
  }

  static List<String> weekdayNames = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday",
  ];
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
