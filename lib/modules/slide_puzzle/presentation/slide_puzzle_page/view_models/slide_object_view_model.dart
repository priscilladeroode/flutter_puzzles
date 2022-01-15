import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'slide_object_view_model.g.dart';

class SlideObjectViewModel = SlideObjectViewModelBase
    with _$SlideObjectViewModel;

abstract class SlideObjectViewModelBase with Store {
  @observable
  Offset posDefault;

  @observable
  int indexDefault;

  @observable
  Size size;

  @observable
  Image image;

  @observable
  Offset posCurrent;

  @observable
  int indexCurrent;

  @observable
  bool empty = false;

  SlideObjectViewModelBase(
      {required this.posDefault,
      required this.indexDefault,
      required this.size,
      required this.image,
      this.empty = false,
      this.indexCurrent = 0,
      required this.posCurrent});
}
