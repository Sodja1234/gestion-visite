import '../business/models/patient.dart';
import '../business/models/visiteur.dart';
import '../business/services/gestionService.dart';

class GestionServiceV0 implements GestionService {
  List<Patient> patients = [];
  List<Visiteur> visiteurs = [];
  @override
  bool creerPatient(patient) {
    patients.add(patient);
    return true;
  }

  @override
  bool creerVisiteur(visiteur) {
    visiteurs.add(visiteur);
    return true;
  }

  @override
  List<Patient> lirePatients() {
    return patients;
  }

  @override
  List<Visiteur> lireVisiteurs() {
    return visiteurs;
  }

  @override
  Patient? rechercherPatient(String nom) {
    List<Patient> patientslist = lirePatients();
    for (Patient patient in patientslist) {
      if (patient.nom == nom) {
        return patient;
      }
    }
    return null;
  }
}
