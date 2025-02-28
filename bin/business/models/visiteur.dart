
import 'patient.dart';

class Visiteur{
  String nom;
  String genre;
  String heureArr;
  String heureDep;
  Patient patient;
  String telephone;
  String email;
  
  Visiteur({
    required this.nom,
    required this.genre,
    required this.heureArr,
    required this.heureDep,
    required this.patient,
    required this.telephone,
    required this.email,
  });

  // De map en visiteur
  factory Visiteur.fromJson(Map json) => Visiteur(
        nom: json["nom"],
        genre: json["genre"],
        heureArr: json["heureArr"],
        heureDep: json["heureDep"],
        patient: Patient.fromJson(json["patient"]),
        telephone: json["telephone"],
        email: json["email"],
    );

  // De visiteur en map 
    Map toJson() => {
        "nom": nom,
        "genre": genre,
        "heureArr": heureArr,
        "heureDep": heureDep,
        "patient": patient.toJson(),
        "telephone": telephone,
        "email": email,
    };

}
  