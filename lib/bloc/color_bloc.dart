import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent{amber, light_blue}

class ColorBloc{

  ColorBloc(){
    //connected mapEventToState with eventController Stream
    _eventController.stream.listen(_mapEventToState);
  }

  Color _color = Colors.amber;

  StreamController<ColorEvent> _eventController = StreamController<ColorEvent>();
  //public getter, UI add data to eventSink
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;

  //public getter, UI can get the _stateController stream
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent event){

    if(event == ColorEvent.amber){
      _color = Colors.amber;
    }else{
      _color = Colors.lightBlue;
    }
    //add data to _stateController
    _stateSink.add(_color);
  }

  void dispose(){
    _eventController.close();
    _stateController.close();
  }
}