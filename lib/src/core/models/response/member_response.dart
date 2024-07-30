
class MemberResponse {
  String createdAt;
  String updatedAt;
  String id;
  String nom;
  String prenom;
  String prenomPere;
  String nomPrenomMere;
  String genre;
  String matricule;
  int ordre;
  String dateNaissance;
  String dateInscription;
  String lieuNaissance;
  String statutMatrimonial;
  Zone zone;
  String adresse;
  String numeroTel;
  bool memberCs;
  bool actif;
  SecteurActivite secteurActivite;

  MemberResponse({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.nom,
    required this.prenom,
    required this.prenomPere,
    required this.nomPrenomMere,
    required this.genre,
    required this.matricule,
    required this.ordre,
    required this.dateNaissance,
    required this.dateInscription,
    required this.lieuNaissance,
    required this.statutMatrimonial,
    required this.zone,
    required this.adresse,
    required this.numeroTel,
    required this.memberCs,
    required this.actif,
    required this.secteurActivite,
  });

  factory MemberResponse.fromJson(Map<String, dynamic> json) {
    return MemberResponse(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      prenomPere: json['prenomPere'],
      nomPrenomMere: json['nomPrenomMere'],
      genre: json['genre'],
      matricule: json['matricule'],
      ordre: json['ordre'],
      dateNaissance: json['dateNaissance'],
      dateInscription: json['dateInscription'],
      lieuNaissance: json['lieuNaissance'],
      statutMatrimonial: json['statutMatrimonial'],
      zone: Zone.fromJson(json['zone']),
      adresse: json['adresse'],
      numeroTel: json['numeroTel'],
      memberCs: json['memberCs'],
      actif: json['actif'],
      secteurActivite: SecteurActivite.fromJson(json['secteurActivite']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'prenomPere': prenomPere,
      'nomPrenomMere': nomPrenomMere,
      'genre': genre,
      'matricule': matricule,
      'ordre': ordre,
      'dateNaissance': dateNaissance,
      'dateInscription': dateInscription,
      'lieuNaissance': lieuNaissance,
      'statutMatrimonial': statutMatrimonial,
      'zone': zone.toJson(),
      'adresse': adresse,
      'numeroTel': numeroTel,
      'memberCs': memberCs,
      'actif': actif,
      'secteurActivite': secteurActivite.toJson(),
    };
  }
}

class Zone {
  String createdAt;
  String updatedAt;
  String id;
  String libelle;
  Cellule cellule;
  int nbrMembres;

  Zone({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.libelle,
    required this.cellule,
    required this.nbrMembres,
  });

  factory Zone.fromJson(Map<String, dynamic> json) {
    return Zone(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      libelle: json['libelle'],
      cellule: Cellule.fromJson(json['cellule']),
      nbrMembres: json['nbrMembres'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id': id,
      'libelle': libelle,
      'cellule': cellule.toJson(),
      'nbrMembres': nbrMembres,
    };
  }
}

class Cellule {
  String createdAt;
  String updatedAt;
  String id;
  String libelle;
  Region region;
  int indice;
  int nbrMembres;

  Cellule({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.libelle,
    required this.region,
    required this.indice,
    required this.nbrMembres,
  });

  factory Cellule.fromJson(Map<String, dynamic> json) {
    return Cellule(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      libelle: json['libelle'],
      region: Region.fromJson(json['region']),
      indice: json['indice'],
      nbrMembres: json['nbrMembres'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id': id,
      'libelle': libelle,
      'region': region.toJson(),
      'indice': indice,
      'nbrMembres': nbrMembres,
    };
  }
}

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
