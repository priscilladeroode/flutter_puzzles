import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_home_page/stores/slide_puzzle_home_store.dart';

class SlidePuzzleHomeController {
  final SlidePuzzleHomeStore store;

  SlidePuzzleHomeController(this.store);
  Future<void> getImages() async {
    store.setLoading(true);
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .where((String key) => key.contains('slide_puzzle/'))
        .toList();
    store.setImagesPaths(imagePaths);
    store.setLoading(false);
  }
}
