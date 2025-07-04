class DayEntryModel {
  final DateTime date;
  final Map<String, String> nameDays;
  final Map<String, String>? internationalDay;
  final String regionScope;

  DayEntryModel({
    required this.date,
    required this.nameDays,
    this.internationalDay,
    required this.regionScope,
  });
}
