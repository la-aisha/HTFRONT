class SecteurActivite {
  String createdAt;
  String id;
  String libelle;
  int nbrMembres;

  SecteurActivite({
    required this.createdAt,
    required this.id,
    required this.libelle,
    required this.nbrMembres,
  });

  factory SecteurActivite.fromJson(Map<String, dynamic> json) {
    return SecteurActivite(
      createdAt: json['createdAt'],
      id: json['id'],
      libelle: json['libelle'],
      nbrMembres: json['nbrMembres'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'id': id,
      'libelle': libelle,
      'nbrMembres': nbrMembres,
    };
  }
}
