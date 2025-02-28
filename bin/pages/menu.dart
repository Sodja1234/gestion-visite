import 'dart:io';

import '../business/services/gestionService.dart';
import 'afficherPatient.dart';
import 'afficherVisiteur.dart';
import 'formulairePatient.dart';
import 'formulaireVisiteur.dart';
import 'page.dart';

class Menu implements Page {
  GestionService service;

  Menu({required this.service});

  @override
  void rendu() {

    while (true) {
      List<String> listeDeChoix = ["1", "2", "3"];

      print("\n\n====== GESTION DES VISITEURS DANS UN HOPITAL ======\n");

      print("1. PATIENT");
      print("2. VISITEUR");
      print("3. QUITTER LE PROGRAMME");

      stdout.write("\nReponse [1-3] : ");
      String? choixMenu = stdin.readLineSync();

      if (choixMenu != null &&
          (choixMenu.isEmpty || !listeDeChoix.contains(choixMenu))) {
        print("\nErreur, Vous devez saisir une valeur comprise entre 1 et 3\n");
        continue;

      } else {
 
        if (choixMenu == "1") {
          while (true) {
            print("\n====== PATIENT ======\n");

            print("1. AJOUTER UN PATIENT");
            print("2. AFFICHER LES PATIENTS");
            print("3. MENU PRINCIPAL");

            stdout.write("\nReponse [1-3] : ");
            String? choixMenuPatient = stdin.readLineSync();

            if (choixMenuPatient != null &&
                (choixMenuPatient.isEmpty ||
                    !listeDeChoix.contains(choixMenuPatient))) {
              print(
                  "\nErreur, Vous devez saisir une valeur comprise entre 1 et 3\n");
              continue;
            } else {

              if (choixMenuPatient == "1") {
                
                FormulairePatient formulairePatient = FormulairePatient(service: service);
                formulairePatient.rendu();

                
              } else if (choixMenuPatient == "2") {

                AfficherPatient afficherPatient = AfficherPatient(service: service);
                afficherPatient.rendu();

              } else {
                break;
              }
            }
          }
        } else if (choixMenu == "2") {

          while (true) {
            print("\n====== VISITEUR ======\n");

            print("1. AJOUTER UN VISITEUR");
            print("2. AFFICHER LES VISITEURS");
            print("3. MENU PRINCIPAL");

            stdout.write("\nReponse [1-3] : ");
            String? choixMenuVisiteur = stdin.readLineSync();

            if (choixMenuVisiteur != null &&
                (choixMenuVisiteur.isEmpty ||
                    !listeDeChoix.contains(choixMenuVisiteur))) {
              print(
                  "\nErreur, Vous devez saisir une valeur comprise entre 1 et 3\n");
              continue;

            } else {
              if (choixMenuVisiteur == "1") {
                FormulaireVisiteur formulaireVisiteur =
                    FormulaireVisiteur(service: service);
                formulaireVisiteur.rendu();
              } else if (choixMenuVisiteur == "2") {
                AfficherVisiteur afficherVisiteur =
                    AfficherVisiteur(service: service);

                afficherVisiteur.rendu();
              } else {
                break;
              }
            }
          }
        } else {
          print("Au revoir (:");
          break;
        }
      }
    }
  }
}
