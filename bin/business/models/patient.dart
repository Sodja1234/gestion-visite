class Patient{
  String nom;
  String genre;
  // String serviceHosp;
  // String jourHosp;
  // int numChambr;
  
  Patient({
    required this.nom,
    required this.genre,
  });

  factory Patient.fromJson(Map json) => Patient(
        nom: json["nom"],
        genre: json["genre"],
        
    );

  Map toJson() => {
        "nom": nom,
        "genre": genre,
    };
}
 