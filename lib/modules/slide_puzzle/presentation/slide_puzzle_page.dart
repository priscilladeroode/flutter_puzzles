import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_page/controllers/slide_puzzle_controller.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_page/widgets/action_bar.dart';

import 'slide_puzzle_page/widgets/slide_puzzle.dart';

class SlidePuzzlePage extends StatefulWidget {
  final String imagePath;
  const SlidePuzzlePage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<SlidePuzzlePage> createState() => _SlidePuzzlePageState();
}

class _SlidePuzzlePageState
    extends ModularState<SlidePuzzlePage, SlidePuzzleController> {
  GlobalKey<_SlidePuzzlePageState> globalKey = GlobalKey();
  GlobalKey<_SlidePuzzlePageState> newGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double border = 5;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F2FD),
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Modular.to.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFF0B000),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: const Color(0xFFF7F2FD),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: border,
                  color: const Color(0xFFF0B000),
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.biggest.width,
                    child: SlidePuzzleWidget(
                      key: globalKey,
                      globalKey: newGlobalKey,
                      controller: controller,
                      size: constraints.biggest,
                      imageBckGround: Image(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              // child: ,
            ),
            const SizedBox(height: 24),
            ActionsBar(controller: controller, globalKey: newGlobalKey),
          ],
        ),
      ),
    );
  }
}
