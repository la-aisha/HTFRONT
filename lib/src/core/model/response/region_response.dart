import 'package:hizboufront/src/core/model/response/pays_response.dart';

class Region {
  String createdAt;
  String updatedAt;
  int id;
  String name;
  String sigle;
  Pays pays;

  Region({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.sigle,
    required this.pays,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      name: json['name'],
      sigle: json['sigle'],
      pays: Pays.fromJson(json['pays']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id': id,
      'name': name,
      'sigle': sigle,
      'pays': pays.toJson(),
    };
  }
}
