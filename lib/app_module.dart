import 'package:flutter_modular/flutter_modular.dart';
import 'package:puzzles/modules/slide_puzzle/slide_puzzle_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ModuleRoute('/slide-puzzle', module: SlidePuzzleModule())
      ];
}
