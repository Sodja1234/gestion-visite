import '../models/patient.dart';
import '../models/visiteur.dart';

abstract class GestionService{

  bool creerPatient( Patient patient);
  List<Patient> lirePatients();
  
   bool creerVisiteur( Visiteur visiteur);
  List<Visiteur> lireVisiteurs();

  Patient? rechercherPatient(String nom);

}