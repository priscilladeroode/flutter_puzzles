import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:image/image.dart' as image;
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_page/stores/slide_puzzle_store.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_page/view_models/slide_object_view_model.dart';

class SlidePuzzleController {
  final SlidePuzzleStore store;

  SlidePuzzleController(this.store);

  void clearPuzzle() {
    store.setStartSlide(true);
    store.slideObjects = null;
    store.setFinishSwap(true);
  }

  SlideObjectViewModel getEmptyObject() {
    return store.slideObjects!.firstWhere((element) => element.empty);
  }

  changePos(int indexCurrent) {
    SlideObjectViewModel slideObjectEmpty = getEmptyObject();

    int emptyIndex = slideObjectEmpty.indexCurrent;

    int minIndex = min(indexCurrent, emptyIndex);
    int maxIndex = max(indexCurrent, emptyIndex);

    List<SlideObjectViewModel> rangeMoves = [];

    if (indexCurrent % store.sizePuzzle == emptyIndex % store.sizePuzzle) {
      rangeMoves = store.slideObjects!
          .where((element) =>
              element.indexCurrent % store.sizePuzzle ==
              indexCurrent % store.sizePuzzle)
          .toList();
    } else if (indexCurrent ~/ store.sizePuzzle ==
        emptyIndex ~/ store.sizePuzzle) {
      rangeMoves = store.slideObjects!;
    } else {
      rangeMoves = [];
    }

    rangeMoves = rangeMoves
        .where((puzzle) =>
            puzzle.indexCurrent >= minIndex &&
            puzzle.indexCurrent <= maxIndex &&
            puzzle.indexCurrent != emptyIndex)
        .toList();

    if (emptyIndex < indexCurrent) {
      rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 1 : 0);
    } else {
      rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 0 : 1);
    }

    if (rangeMoves.isNotEmpty) {
      int tempIndex = rangeMoves[0].indexCurrent;

      Offset tempPos = rangeMoves[0].posCurrent;

      for (var i = 0; i < rangeMoves.length - 1; i++) {
        rangeMoves[i].indexCurrent = rangeMoves[i + 1].indexCurrent;
        rangeMoves[i].posCurrent = rangeMoves[i + 1].posCurrent;
      }

      rangeMoves.last.indexCurrent = slideObjectEmpty.indexCurrent;
      rangeMoves.last.posCurrent = slideObjectEmpty.posCurrent;

      slideObjectEmpty.indexCurrent = tempIndex;
      slideObjectEmpty.posCurrent = tempPos;
    }

    if (store.slideObjects!
                .where((slideObject) =>
                    slideObject.indexCurrent == slideObject.indexDefault - 1)
                .length ==
            store.slideObjects!.length &&
        store.finishSwap) {
      store.setSuccess(true);
    } else {
      store.setSuccess(false);
    }

    store.setStartSlide(true);
  }

  reversePuzzle() async {
    store.setStartSlide(true);
    store.setFinishSwap(true);

    await Stream.fromIterable(store.process.reversed)
        .asyncMap((event) async =>
            await Future.delayed(const Duration(milliseconds: 50))
                .then((value) => changePos(event)))
        .toList();

    store.clearProcess();
  }

  getImageFromWidget(RenderRepaintBoundary boundary) async {
    var img = await boundary.toImage();
    var byteData = await img.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData?.buffer.asUint8List() as List<int>;

    return image.decodeImage(pngBytes);
  }

  Future<List<SlideObjectViewModel>> cropImage(GlobalKey globalKey) async {
    if (store.fullImage == null) {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      store.size = boundary.size;
      store.fullImage ??= await getImageFromWidget(boundary);
    }
    Size sizeBox = Size(store.size!.width / store.sizePuzzle,
        store.size!.width / store.sizePuzzle);

    final slideObjects =
        List.generate(store.sizePuzzle * store.sizePuzzle, (index) {
      Offset offsetTemp = Offset(
        index % store.sizePuzzle * sizeBox.width,
        index ~/ store.sizePuzzle * sizeBox.height,
      );
      image.Image tempCrop;
      tempCrop = image.copyCrop(
        store.fullImage!,
        offsetTemp.dx.round(),
        offsetTemp.dy.round(),
        sizeBox.width.round(),
        sizeBox.height.round(),
      );

      return SlideObjectViewModel(
        posCurrent: offsetTemp,
        posDefault: offsetTemp,
        indexCurrent: index,
        indexDefault: index + 1,
        size: sizeBox,
        image: Image.memory(
          Uint8List.fromList(image.encodePng(tempCrop)),
          fit: BoxFit.contain,
        ),
      );
    });
    return slideObjects;
  }

  generatePuzzle(GlobalKey globalKey) async {
    store.setFinishSwap(false);

    final slideObjects = await cropImage(globalKey);

    store.setSlideObjects(slideObjects);
    store.slideObjects?.last.empty = true;
    bool swap = true;
    store.clearProcess();

    for (var i = 0; i < store.sizePuzzle * 20; i++) {
      for (var j = 0; j < store.sizePuzzle / 2; j++) {
        SlideObjectViewModel slideObjectEmpty = getEmptyObject();

        int emptyIndex = slideObjectEmpty.indexCurrent;
        store.addValueProcess(emptyIndex);

        int randKey;

        if (swap) {
          int row = emptyIndex ~/ store.sizePuzzle;
          randKey = row * store.sizePuzzle +
              Random().nextInt(store.sizePuzzle).toInt();
        } else {
          int col = emptyIndex % store.sizePuzzle;
          randKey = store.sizePuzzle * Random().nextInt(store.sizePuzzle) + col;
        }

        changePos(randKey);
        swap = !swap;
      }
    }

    store.setStartSlide(false);
    store.setFinishSwap(true);
  }
}
