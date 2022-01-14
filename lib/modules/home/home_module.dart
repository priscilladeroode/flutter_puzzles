import 'package:flutter_modular/flutter_modular.dart';
import 'package:puzzles/modules/home/presentation/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => const HomePage(),
        )
      ];
}
