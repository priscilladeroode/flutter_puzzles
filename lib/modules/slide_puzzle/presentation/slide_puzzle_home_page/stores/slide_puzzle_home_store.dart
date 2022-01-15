import 'package:mobx/mobx.dart';

part 'slide_puzzle_home_store.g.dart';

class SlidePuzzleHomeStore = SlidePuzzleHomeStoreBase
    with _$SlidePuzzleHomeStore;

abstract class SlidePuzzleHomeStoreBase with Store {
  @observable
  ObservableList<String> imagesPaths = ObservableList.of([]);

  @observable
  bool loading = false;

  @action
  setImagesPaths(List<String> list) => imagesPaths.addAll(list);

  @action
  setLoading(bool value) => loading = value;
}
