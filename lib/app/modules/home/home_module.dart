import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_list/app/modules/home/home_page.dart';
import 'package:u_list/app/modules/home/home_store.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage()),
      ];
}
