class LatestListingPriceResponse {
    LatestListingPriceResponse({
        required this.date,
        required this.o,
        required this.h,
        required this.l,
        required this.c,
        required this.cz,
        required this.czg,
        required this.tq,
    });

    DateTime date;
    double o;
    double h;
    double l;
    double c;
    double cz;
    double czg;
    double tq;

    factory LatestListingPriceResponse.fromJson(Map<String, dynamic> json) => LatestListingPriceResponse(
        date: DateTime.parse(json["Date"]),
        o: json["O"],
        h: json["H"].toDouble(),
        l: json["L"].toDouble(),
        c: json["C"].toDouble(),
        cz: json["CZ"].toDouble(),
        czg: json["CZG"].toDouble(),
        tq: json["TQ"],
    );

    Map<String, dynamic> toJson() => {
        "Date": date.toIso8601String(),
        "O": o,
        "H": h,
        "L": l,
        "C": c,
        "CZ": cz,
        "CZG": czg,
        "TQ": tq,
    };
}
