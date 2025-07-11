class DayEntryModel {
  final DateTime date;
  final Map<String, String> nameDays;
  final Map<String, String>? globalDay;
  final String regionScope;

  DayEntryModel({
    required this.date,
    required this.nameDays,
    this.globalDay,
    required this.regionScope,
  });
}
