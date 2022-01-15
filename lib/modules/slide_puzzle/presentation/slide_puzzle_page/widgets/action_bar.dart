import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:puzzles/design_system/puzzle_elevated_button.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_page/controllers/slide_puzzle_controller.dart';

class ActionsBar extends StatefulWidget {
  final SlidePuzzleController controller;
  final GlobalKey globalKey;

  const ActionsBar({
    Key? key,
    required this.controller,
    required this.globalKey,
  }) : super(key: key);

  @override
  State<ActionsBar> createState() => _ActionsBarState();
}

class _ActionsBarState extends State<ActionsBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        decoration: const BoxDecoration(
            color: Color(0xFF8338EC),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: Column(
          children: [
            Observer(builder: (context) {
              return Slider(
                  min: 2,
                  max: 15,
                  divisions: 13,
                  activeColor: const Color(0xFFF0B000),
                  thumbColor: const Color(0xFFF0B000),
                  inactiveColor: const Color(0xFFFFDF87),
                  label: widget.controller.store.sizePuzzle.toString(),
                  value: widget.controller.store.sizePuzzle.toDouble(),
                  onChanged: (value) =>
                      widget.controller.store.setPuzzleSize(value.toInt()));
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: PuzzleElevatedButton.primary(
                      onPressed: () =>
                          widget.controller.generatePuzzle(widget.globalKey),
                      text: "GENERATE"),
                ),
                const SizedBox(width: 16),
                Observer(builder: (context) {
                  return Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: PuzzleElevatedButton.primary(
                        onPressed: widget.controller.store.startSlide
                            ? null
                            : widget.controller.reversePuzzle,
                        text: "REVERSE"),
                  );
                }),
              ],
            ),
            const SizedBox(height: 16),
            PuzzleElevatedButton.secondary(
              expanded: true,
              onPressed: widget.controller.clearPuzzle,
              text: "CLEAR",
            ),
          ],
        ),
      ),
    );
  }
}
