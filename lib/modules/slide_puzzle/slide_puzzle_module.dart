import 'package:flutter_modular/flutter_modular.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/controllers/slide_puzzle_controller.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_page.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/stores/slide_puzzle_store.dart';

class SlidePuzzleModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => SlidePuzzleController(i())),
        Bind.lazySingleton((i) => SlidePuzzleStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, __) => const SlidePuzzlePage()),
      ];
}
