// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_puzzle_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SlidePuzzleStore on SlidePuzzleStoreBase, Store {
  final _$sizePuzzleAtom = Atom(name: 'SlidePuzzleStoreBase.sizePuzzle');

  @override
  int get sizePuzzle {
    _$sizePuzzleAtom.reportRead();
    return super.sizePuzzle;
  }

  @override
  set sizePuzzle(int value) {
    _$sizePuzzleAtom.reportWrite(value, super.sizePuzzle, () {
      super.sizePuzzle = value;
    });
  }

  final _$successAtom = Atom(name: 'SlidePuzzleStoreBase.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$startSlideAtom = Atom(name: 'SlidePuzzleStoreBase.startSlide');

  @override
  bool get startSlide {
    _$startSlideAtom.reportRead();
    return super.startSlide;
  }

  @override
  set startSlide(bool value) {
    _$startSlideAtom.reportWrite(value, super.startSlide, () {
      super.startSlide = value;
    });
  }

  final _$finishSwapAtom = Atom(name: 'SlidePuzzleStoreBase.finishSwap');

  @override
  bool get finishSwap {
    _$finishSwapAtom.reportRead();
    return super.finishSwap;
  }

  @override
  set finishSwap(bool value) {
    _$finishSwapAtom.reportWrite(value, super.finishSwap, () {
      super.finishSwap = value;
    });
  }

  final _$processAtom = Atom(name: 'SlidePuzzleStoreBase.process');

  @override
  List<int> get process {
    _$processAtom.reportRead();
    return super.process;
  }

  @override
  set process(List<int> value) {
    _$processAtom.reportWrite(value, super.process, () {
      super.process = value;
    });
  }

  final _$slideObjectsAtom = Atom(name: 'SlidePuzzleStoreBase.slideObjects');

  @override
  ObservableList<SlideObjectViewModel>? get slideObjects {
    _$slideObjectsAtom.reportRead();
    return super.slideObjects;
  }

  @override
  set slideObjects(ObservableList<SlideObjectViewModel>? value) {
    _$slideObjectsAtom.reportWrite(value, super.slideObjects, () {
      super.slideObjects = value;
    });
  }

  final _$sizeAtom = Atom(name: 'SlidePuzzleStoreBase.size');

  @override
  Size? get size {
    _$sizeAtom.reportRead();
    return super.size;
  }

  @override
  set size(Size? value) {
    _$sizeAtom.reportWrite(value, super.size, () {
      super.size = value;
    });
  }

  final _$fullImageAtom = Atom(name: 'SlidePuzzleStoreBase.fullImage');

  @override
  image.Image? get fullImage {
    _$fullImageAtom.reportRead();
    return super.fullImage;
  }

  @override
  set fullImage(image.Image? value) {
    _$fullImageAtom.reportWrite(value, super.fullImage, () {
      super.fullImage = value;
    });
  }

  final _$SlidePuzzleStoreBaseActionController =
      ActionController(name: 'SlidePuzzleStoreBase');

  @override
  dynamic setPuzzleSize(int value) {
    final _$actionInfo = _$SlidePuzzleStoreBaseActionController.startAction(
        name: 'SlidePuzzleStoreBase.setPuzzleSize');
    try {
      return super.setPuzzleSize(value);
    } finally {
      _$SlidePuzzleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSuccess(bool value) {
    final _$actionInfo = _$SlidePuzzleStoreBaseActionController.startAction(
        name: 'SlidePuzzleStoreBase.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$SlidePuzzleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStartSlide(bool value) {
    final _$actionInfo = _$SlidePuzzleStoreBaseActionController.startAction(
        name: 'SlidePuzzleStoreBase.setStartSlide');
    try {
      return super.setStartSlide(value);
    } finally {
      _$SlidePuzzleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFinishSwap(bool value) {
    final _$actionInfo = _$SlidePuzzleStoreBaseActionController.startAction(
        name: 'SlidePuzzleStoreBase.setFinishSwap');
    try {
      return super.setFinishSwap(value);
    } finally {
      _$SlidePuzzleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearProcess() {
    final _$actionInfo = _$SlidePuzzleStoreBaseActionController.startAction(
        name: 'SlidePuzzleStoreBase.clearProcess');
    try {
      return super.clearProcess();
    } finally {
      _$SlidePuzzleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addValueProcess(int value) {
    final _$actionInfo = _$SlidePuzzleStoreBaseActionController.startAction(
        name: 'SlidePuzzleStoreBase.addValueProcess');
    try {
      return super.addValueProcess(value);
    } finally {
      _$SlidePuzzleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSlideObjects(List<SlideObjectViewModel> list) {
    final _$actionInfo = _$SlidePuzzleStoreBaseActionController.startAction(
        name: 'SlidePuzzleStoreBase.setSlideObjects');
    try {
      return super.setSlideObjects(list);
    } finally {
      _$SlidePuzzleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSize(Size value) {
    final _$actionInfo = _$SlidePuzzleStoreBaseActionController.startAction(
        name: 'SlidePuzzleStoreBase.setSize');
    try {
      return super.setSize(value);
    } finally {
      _$SlidePuzzleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFullImage(image.Image value) {
    final _$actionInfo = _$SlidePuzzleStoreBaseActionController.startAction(
        name: 'SlidePuzzleStoreBase.setFullImage');
    try {
      return super.setFullImage(value);
    } finally {
      _$SlidePuzzleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sizePuzzle: ${sizePuzzle},
success: ${success},
startSlide: ${startSlide},
finishSwap: ${finishSwap},
process: ${process},
slideObjects: ${slideObjects},
size: ${size},
fullImage: ${fullImage}
    ''';
  }
}
