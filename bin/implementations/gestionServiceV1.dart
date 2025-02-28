import 'dart:io';
import 'dart:convert';

import '../business/models/patient.dart';
import '../business/models/visiteur.dart';
import '../business/services/gestionService.dart';

class GestionServiceV1 implements GestionService {
  String bdPatients = "bdPatients.txt";
  String bdVisiteurs = "bdVisiteurs.txt";

  @override
  bool creerPatient(Patient patient) {
    // Verifier si le fichier existe
    File file = File(bdPatients);

    if (!file.existsSync()) {
      file.createSync();
       file.writeAsStringSync("[]");
    }

    List<Patient> listePatients = lirePatients();
    listePatients.add(patient);

    // Ecrire dans le fichier
    // Conversion des etudiants en map pour pouvoir les ecrire dans le fichier
    file.writeAsStringSync(
        jsonEncode(listePatients.map((patient) => patient.toJson()).toList()));

    return true;
  }

  @override
  List<Patient> lirePatients() {
    File file = File(bdPatients);

    // Verifier si le fichier existe
    if (!file.existsSync()) {
      return [];
    }

    // Lire le fichier et decode le json en map
    List<dynamic> data = jsonDecode(file.readAsStringSync());

    // Convertir les maps en etudiants
    List<Patient> listePatients = data.map((e) => Patient.fromJson(e)).toList();

    return listePatients;
  }

  @override
  bool creerVisiteur(Visiteur visiteur) {
    // Verifier si le fichier existe
    File file = File(bdVisiteurs);

    if (!file.existsSync()) {
      file.createSync();
      file.writeAsStringSync("[]");
    }

    List<Visiteur> listeVisiteurs = lireVisiteurs();
    listeVisiteurs.add(visiteur);

    // Ecrire dans le fichier
    // Conversion deslistePatientsants en map pour pouvoir les ecrire dans le fichier
    file.writeAsStringSync(jsonEncode(
        listeVisiteurs.map((visiteur) => visiteur.toJson()).toList()));

    return true;
  }

  @override
  List<Visiteur> lireVisiteurs() {
    File file = File(bdVisiteurs);

    // Verifier si le fichier existe
    if (!file.existsSync()) {
      return [];
    }

    // Lire le fichier et decode le json en map
    List<dynamic> data = jsonDecode(file.readAsStringSync());

    // Convertir les maps en etudiants
    List<Visiteur> listeVisiteurs =
        data.map((e) => Visiteur.fromJson(e)).toList();

    return listeVisiteurs;
  }

  @override
  Patient? rechercherPatient(String nom) {
    List<Patient> patientslist = lirePatients();
    List<Patient> patientTrouver = patientslist.where((patient) => patient.nom == nom).toList();
      return patientTrouver.isNotEmpty ? patientTrouver.first : null;

  }
}
