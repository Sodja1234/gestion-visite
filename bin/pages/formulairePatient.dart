import 'dart:io';
import '../business/models/patient.dart' ;
import '../business/services/gestionService.dart';
import 'page.dart';

class FormulairePatient implements Page {

  GestionService service; 
  
  FormulairePatient({required this. service});

  void generationChoix(String textChoix, List listeChoix) {
   
    print(textChoix);
    listeChoix.asMap().forEach((key, value) {
      int position = key + 1 ;
      print("$position : $value ")  ;
    });
  }

  @override
  void rendu(){

    stdout.write("Saisir nom : ") ;
    String? nom = stdin.readLineSync() ;

    List listeGenres = ["Homme","Femme"] ;
    generationChoix("Saisir genre : ", listeGenres) ;
    String? genre = stdin.readLineSync() ;

    service.creerPatient(Patient(
      nom: nom!,
      genre: listeGenres.elementAt(int.parse(genre!)),
    ));

  }
}