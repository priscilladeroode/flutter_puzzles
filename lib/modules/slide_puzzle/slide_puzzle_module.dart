import 'package:flutter_modular/flutter_modular.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_home_page/controllers/slide_puzzle_home_controller.dart';

import 'presentation/slide_puzzle_home_page/slide_puzzle_home_page.dart';
import 'presentation/slide_puzzle_home_page/stores/slide_puzzle_home_store.dart';
import 'presentation/slide_puzzle_page.dart';
import 'presentation/slide_puzzle_page/controllers/slide_puzzle_controller.dart';
import 'presentation/slide_puzzle_page/stores/slide_puzzle_store.dart';

class SlidePuzzleModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => SlidePuzzleController(i())),
        Bind.factory((i) => SlidePuzzleHomeController(i())),
        Bind.factory((i) => SlidePuzzleStore()),
        Bind.factory((i) => SlidePuzzleHomeStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, __) => const SlidePuzzleHomePage()),
        ChildRoute("/game",
            child: (_, args) => SlidePuzzlePage(
                  imagePath: args.data,
                )),
      ];
}
