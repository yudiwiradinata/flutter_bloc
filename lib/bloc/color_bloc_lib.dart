import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent{amber, lightb_blue}

class ColorBlocLib extends Bloc<ColorEvent, Color>{
  Color _color = Colors.amber;

  @override
  Color get initialState => Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    if(event == ColorEvent.amber){
      _color = Colors.amber;
    }else{
      _color = Colors.lightBlue;
    }
    yield _color;
  }

}