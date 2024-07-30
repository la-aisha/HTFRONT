class User {
  int? id;
  String? name;
  String? prenom;
  String? date_naissance;
  String? adresse;
  String? telephone;
  String? email;
  String? password;
  bool? status;
  String? image;
  String? numero_permis;
  String? numero_voiture;
  String? couleur_voiture;
  String? photo_permis;
  int? idRole;
  Role? role;

  User(
      {this.id,
      this.name,
      this.date_naissance,
      this.adresse,
      this.telephone,
      this.email,
      this.password,
      this.status,
      this.image,
      this.numero_permis,
      this.numero_voiture,
      this.couleur_voiture,
      this.photo_permis,
      this.idRole,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date_naissance = json['date_naissance'];
    adresse = json['adresse'];
    telephone = json['telephone'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    image = json['image'];
    numero_permis = json['numero_permis'];
    numero_voiture = json['nemero_seris'];
    couleur_voiture = json['couleur_voiture'];
    photo_permis = json['scann_permis'];
    idRole = json['id_role'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date_naissance'] = this.date_naissance;
    data['adresse'] = this.adresse;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['status'] = this.status;
    data['image'] = this.image;
    data['numero_permis'] = this.numero_permis;
    data['nemero_seris'] = this.numero_voiture;
    data['couleur_voiture'] = this.couleur_voiture;
    data['scann_permis'] = this.photo_permis;
    data['id_role'] = this.idRole;
    // if (this.role != null) {
    //   data['role'] = this.role!.toJson();
    // }
    return data;
  }
}

class Role {
  int? id;
  String? libelle;

  Role({this.id, this.libelle});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['libelle'] = this.libelle;
    return data;
  }
}

class SinUpObject {
  static User user = User();
  // static resetUser() {
  //   user = User();
  // }
}
