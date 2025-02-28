import 'business/services/gestionService.dart';
import 'implementations/gestionServiceV1.dart';
import 'pages/menu.dart';

void main() {

    GestionService service = GestionServiceV1();

    Menu menu = Menu(service: service);

    menu.rendu();
}