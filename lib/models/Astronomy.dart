class Astronomys {
  List<Astronomy> listaAstronomy = [];

  Astronomys();
  Astronomys.fromJsonList(List<dynamic> json) {
    if (json == null) return;
    for (var item in json) {
      final astronomy = Astronomy.fromJson(item);
      listaAstronomy.add(astronomy);
    }
  }
}

class Astronomy {
  Astronomy({
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
    this.copyright,
  });

  String date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;
  String copyright;

  factory Astronomy.fromJson(Map<String, dynamic> json) => Astronomy(
        date: json["date"],
        explanation: json["explanation"],
        hdurl: json["hdurl"] == null ? null : json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"],
        copyright: json["copyright"] == null ? null : json["copyright"],
      );
}
