import 'dart:convert';

List<Banks> banksFromJson(String str) =>
    List<Banks>.from(json.decode(str).map((x) => Banks.fromJson(x)));

String banksToJson(List<Banks> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Banks {
  Banks({
    required this.name,
    required this.slug,
    required this.code,
    required this.ussd,
    required this.logo,
  });

  String name;
  String slug;
  String code;
  String ussd;
  String logo;

  factory Banks.fromJson(Map<String, dynamic> json) => Banks(
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        ussd: json["ussd"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "code": code,
        "ussd": ussd,
        "logo": logo,
      };

  @override
  String toString() {
    return 'Banks(name: $name, slug: $slug, code: $code, ussd: $ussd, logo: $logo)';
  }
}
