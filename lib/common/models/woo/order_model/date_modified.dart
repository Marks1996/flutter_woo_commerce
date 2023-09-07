class DateModified {
  String? date;
  int? timezoneType;
  String? timezone;

  DateModified({this.date, this.timezoneType, this.timezone});

  factory DateModified.fromJson(Map<String, dynamic> json) => DateModified(
        date: json['date'] as String?,
        timezoneType: json['timezone_type'] as int?,
        timezone: json['timezone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'timezone_type': timezoneType,
        'timezone': timezone,
      };
}
