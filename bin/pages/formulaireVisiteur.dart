import 'dart:io';

import '../business/models/patient.dart';
import '../business/models/visiteur.dart';
import '../business/services/gestionService.dart';
import 'page.dart';

class FormulaireVisiteur implements Page {

  GestionService service;

  FormulaireVisiteur({
    required this.service
  });

  @override
  void rendu() {

    // Permet de récupèrer les informations d'un visiteur
    print("\nVISITEUR FORMULAIRE");
    print("="*20);

    stdout.write("Saisissez le nom du visiteur [*] : ");
    String? nomVisiteur = stdin.readLineSync();

    List<String> listeGenres = ["Homme", "Femme"];
    genererChoix(listeGenres, "Choisissez le genre [*] : "); 
    String? genreVisiteur = stdin.readLineSync();

    stdout.write("Saisissez l'heure d'arriver [*] : ");
    String? heureArr = stdin.readLineSync();

    stdout.write("Saisissez l'heure de départ [*] : ");
    String? heureDep = stdin.readLineSync();

    stdout.write("Saisissez le nom complet du patient [*] : ");
    String? nomPatientVisiteur = stdin.readLineSync();

    Patient? patientTrouver = verificationPatient(nomPatientVisiteur!);

    if (patientTrouver == null) {
      print("Nous n'avons pas trouvé le patient");

      exit(1);

    }

    stdout.write("Saisissez le numéro de téléphone [*] : ");
    String? telephone = stdin.readLineSync();

    stdout.write("Saisissez l'adresse e-mail [*] : ");
    String? email = stdin.readLineSync();

    var visiteur = Visiteur(
      nom: nomVisiteur!, 
      genre: listeGenres.elementAt(int.parse(genreVisiteur!)), 
      heureArr: heureArr!, 
      heureDep: heureDep!, 
      patient: patientTrouver,
      telephone: telephone!, 
      email: email!
    );

    service.creerVisiteur(visiteur);

    print("\n Les informations du visiteur ont été enregistrés. \n");

  }

  void genererChoix(List<String> listes, String message)
  {
    listes.asMap().forEach((k, v) {
      message += "\n${k+1}. $v \n";
    });

    print(message);
  }

  Patient? verificationPatient(String nomPatient)
  {
    return service.rechercherPatient(nomPatient);
  }
  
}