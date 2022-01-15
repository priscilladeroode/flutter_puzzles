import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/view_models/slide_object_view_model.dart';
import 'package:image/image.dart' as image;

part 'slide_puzzle_store.g.dart';

class SlidePuzzleStore = SlidePuzzleStoreBase with _$SlidePuzzleStore;

abstract class SlidePuzzleStoreBase with Store {
  @observable
  int sizePuzzle = 2;

  @observable
  bool success = false;

  @observable
  bool startSlide = false;

  @observable
  bool finishSwap = false;

  @observable
  List<int> process = [];

  @observable
  ObservableList<SlideObjectViewModel>? slideObjects;

  @observable
  Size? size;

  @observable
  image.Image? fullImage;

  @action
  setPuzzleSize(int value) => sizePuzzle = value;

  @action
  setSuccess(bool value) => success = value;

  @action
  setStartSlide(bool value) => startSlide = value;

  @action
  setFinishSwap(bool value) => finishSwap = value;

  @action
  clearProcess() => process = [];

  @action
  addValueProcess(int value) => process.add(value);

  @action
  setSlideObjects(List<SlideObjectViewModel> list) =>
      slideObjects = ObservableList<SlideObjectViewModel>.of(list);

  @action
  setSize(Size value) => size = value;

  @action
  setFullImage(image.Image value) => fullImage = value;
}
