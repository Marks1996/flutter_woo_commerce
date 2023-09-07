class DateCreated {
  String? date;
  int? timezoneType;
  String? timezone;

  DateCreated({this.date, this.timezoneType, this.timezone});

  factory DateCreated.fromJson(Map<String, dynamic> json) => DateCreated(
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
