import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:puzzles/commons/render_widget.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/controllers/slide_puzzle_controller.dart';

class SlidePuzzleWidget extends StatefulWidget {
  final Size size;
  final Image imageBckGround;
  final GlobalKey globalKey;

  const SlidePuzzleWidget(
      {Key? key,
      required this.size,
      required this.imageBckGround,
      required this.globalKey})
      : super(key: key);

  @override
  _SlidePuzzleWidgetState createState() => _SlidePuzzleWidgetState();
}

class _SlidePuzzleWidgetState
    extends ModularState<SlidePuzzleWidget, SlidePuzzleController> {
  Size? size;

  @override
  void initState() {
    controller.store.size = Size(widget.size.width, widget.size.width);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: widget.size.width,
            height: widget.size.width,
            child: RenderWidget(
              render: controller.store.slideObjects == null,
              child: RepaintBoundary(
                key: widget.globalKey,
                child: SizedBox(
                  height: double.maxFinite,
                  child: widget.imageBckGround,
                ),
              ),
              replacement: Stack(
                children: controller.store.slideObjects != null
                    ? controller.store.slideObjects!.map(
                        (slideObject) {
                          if (slideObject.empty) {
                            return Positioned(
                              left: slideObject.posCurrent.dx,
                              top: slideObject.posCurrent.dy,
                              child: SizedBox(
                                width: slideObject.size.width,
                                height: slideObject.size.height,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(2),
                                  color: Colors.white24,
                                  child: Stack(
                                    children: [
                                      ...[
                                        Observer(builder: (context) {
                                          return Opacity(
                                            opacity: controller.store.success
                                                ? 1
                                                : 0.3,
                                            child: slideObject.image,
                                          );
                                        })
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return AnimatedPositioned(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease,
                              left: slideObject.posCurrent.dx,
                              top: slideObject.posCurrent.dy,
                              child: GestureDetector(
                                onTap: () => controller
                                    .changePos(slideObject.indexCurrent),
                                child: SizedBox(
                                  width: slideObject.size.width,
                                  height: slideObject.size.height,
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.all(2),
                                    color: Colors.blue,
                                    child: Stack(
                                      children: [
                                        ...[slideObject.image],
                                        Center(
                                          child: Text(
                                            "${slideObject.indexDefault}",
                                          ),
                                        ),

                                        // nice one.. lets make it random
                                      ],
                                    ),
                                    // nice one
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ).toList()
                    : [Container()],
              ),
            ),
          ),
        ],
      );
    });
  }
}
