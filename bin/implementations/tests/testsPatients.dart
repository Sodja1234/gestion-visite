import '../../business/models/patient.dart';
import '../../business/services/gestionService.dart';
import '../gestionServiceV1.dart';


void main(){
  Patient patient1 = Patient(nom: "franklin", genre: "Homme");
  Patient patient2 = Patient(nom: "delice", genre: "Femme");
  Patient patient3 = Patient(nom: "laurent", genre: "Homme");
  Patient patient4 = Patient(nom: "jeremie", genre: "Homme");

  GestionService service = GestionServiceV1();

  service.creerPatient(patient1);
  service.creerPatient(patient2);
  service.creerPatient(patient3);
  service.creerPatient(patient4);

  List<Patient> listePatients = service.lirePatients();

  listePatients.forEach((patient) {
    print(patient.nom);
  });
  
  var patientA = service.rechercherPatient("franklin");
  var patientB = service.rechercherPatient("franklin2");

  print(patientA?.nom);
  print(patientB?.nom);

}
