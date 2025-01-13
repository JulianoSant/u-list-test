import 'package:flutter_modular/flutter_modular.dart';
import 'list_detail_page.dart';
import 'list_detail_store.dart';

class ListDetailModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ListDetailStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => ListDetailPage(list: args.data)),
      ];
}
