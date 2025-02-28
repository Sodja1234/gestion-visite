import '../../business/models/patient.dart';
import '../../business/models/visiteur.dart';
import '../../business/services/gestionService.dart';
import '../gestionServiceV1.dart';


void main(){
  GestionService service = GestionServiceV1();

  Patient patient = Patient(nom: "franklin", genre: "Homme");

  Visiteur visiteur = Visiteur(
    nom: "hugues",
    genre: "Homme",
    heureArr: "12:00",
    heureDep: "12:30", 
    patient: patient, 
    telephone: "09900354214", 
    email: "@odc.com");

  service.creerVisiteur(visiteur);
  
  List<Visiteur> listeVisiteurs = service.lireVisiteurs();
 
  listeVisiteurs.forEach((visiteur) {
    print(visiteur.nom);
  });

}
