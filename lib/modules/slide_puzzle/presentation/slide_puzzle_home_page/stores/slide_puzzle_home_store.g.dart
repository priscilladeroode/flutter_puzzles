// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_puzzle_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SlidePuzzleHomeStore on SlidePuzzleHomeStoreBase, Store {
  final _$imagesPathsAtom = Atom(name: 'SlidePuzzleHomeStoreBase.imagesPaths');

  @override
  ObservableList<String> get imagesPaths {
    _$imagesPathsAtom.reportRead();
    return super.imagesPaths;
  }

  @override
  set imagesPaths(ObservableList<String> value) {
    _$imagesPathsAtom.reportWrite(value, super.imagesPaths, () {
      super.imagesPaths = value;
    });
  }

  final _$loadingAtom = Atom(name: 'SlidePuzzleHomeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$SlidePuzzleHomeStoreBaseActionController =
      ActionController(name: 'SlidePuzzleHomeStoreBase');

  @override
  dynamic setImagesPaths(List<String> list) {
    final _$actionInfo = _$SlidePuzzleHomeStoreBaseActionController.startAction(
        name: 'SlidePuzzleHomeStoreBase.setImagesPaths');
    try {
      return super.setImagesPaths(list);
    } finally {
      _$SlidePuzzleHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$SlidePuzzleHomeStoreBaseActionController.startAction(
        name: 'SlidePuzzleHomeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$SlidePuzzleHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imagesPaths: ${imagesPaths},
loading: ${loading}
    ''';
  }
}
