import '../business/models/patient.dart' ;
import '../business/services/gestionService.dart';
import 'page.dart';

class AfficherPatient implements Page {

  GestionService service; 
  AfficherPatient({required this. service});

  @override
  void rendu(){
    
   List<Patient> patients = service.lirePatients();
    
    patients.asMap().forEach((key, value) {
      print("${key+1} : ${value.nom} | ${value.genre} | ");
    });
  
  }

}