class WeekHelper {
  static String getWeekdayNameFromNumber(int weekdayNum) {
    return weekdayNames.elementAt(weekdayNum);
  }

  static int weekdayNameToNum(String weekdayName) {
    return weekdayNames.indexOf(weekdayName);
  }

  static String longToShortName(String longName) {
    return longToShortMap[longName] ?? "error";
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
  static Map<String, String> longToShortMap = {
    "monday": "mon",
    "tuesday": "tue",
    "wednesday": "wed",
    "thursday": "thu",
    "friday": "fri",
    "saturday": "sat",
    "sunday": "sun",
  };
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
