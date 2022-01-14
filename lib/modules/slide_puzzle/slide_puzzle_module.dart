import 'package:flutter_modular/flutter_modular.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_page.dart';

class SlidePuzzleModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, __) => const SlidePuzzlePage()),
      ];
}
