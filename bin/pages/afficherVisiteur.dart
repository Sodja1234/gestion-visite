import '../business/services/gestionService.dart';
import 'page.dart';

class AfficherVisiteur implements Page {

  GestionService service;

  AfficherVisiteur({
    required this.service
  });


  @override
  void rendu() {
    print("\n");
    
    service.lireVisiteurs().asMap().forEach((k, visiteur) {
      
      print("="*20);
      print("==== INFORMATION DU VISITEUR N°${k+1} \n");

      print("Nom du visiteur : ${visiteur.nom}");
      print("Genre du visiteur : ${visiteur.genre}");
      print("Heure d'arriver : ${visiteur.nom}");
      print("Heure de depart : ${visiteur.nom}");
      print("Adresse e-mail du visiteur : ${visiteur.email}");
      print("Numero de telephone du visiteur : ${visiteur.telephone}");

      print("==== INFORMATION PATIENT");
      print("Nom du patient : ${visiteur.patient.nom}"
      );
      print("Service : ${visiteur.patient.genre}");

      print("\n");

      print("="*20);
    });
  }
  
}