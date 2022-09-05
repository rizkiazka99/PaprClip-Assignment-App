class SecurityPerformanceResponse {
    SecurityPerformanceResponse({
        required this.id,
        required this.label,
        required this.chartPeriodCode,
        required this.changePercent,
    });

    int id;
    String label;
    String chartPeriodCode;
    double changePercent;

    factory SecurityPerformanceResponse.fromJson(Map<String, dynamic> json) => SecurityPerformanceResponse(
        id: json["ID"],
        label: json["Label"],
        chartPeriodCode: json["ChartPeriodCode"],
        changePercent: json["ChangePercent"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Label": label,
        "ChartPeriodCode": chartPeriodCode,
        "ChangePercent": changePercent,
    };
}
