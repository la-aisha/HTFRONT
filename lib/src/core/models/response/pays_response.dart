


class Pays {
  String createdAt;
  String updatedAt;
  int id;
  String name;
  String iso;
  String niceName;
  String iso3;
  int numCode;
  int phoneCode;

  Pays({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.iso,
    required this.niceName,
    required this.iso3,
    required this.numCode,
    required this.phoneCode,
  });

  factory Pays.fromJson(Map<String, dynamic> json) {
    return Pays(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      name: json['name'],
      iso: json['iso'],
      niceName: json['niceName'],
      iso3: json['iso3'],
      numCode: json['numCode'],
      phoneCode: json['phoneCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id': id,
      'name': name,
      'iso': iso,
      'niceName': niceName,
      'iso3': iso3,
      'numCode': numCode,
      'phoneCode': phoneCode,
    };
  }
}
