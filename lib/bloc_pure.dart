
import 'package:flutter/material.dart';

import 'bloc/color_bloc.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bloc = ColorBloc();

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton:
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(onPressed: (){
              bloc.eventSink.add(ColorEvent.amber);
            },backgroundColor: Colors.amber,),
            SizedBox(width: 10,),
            FloatingActionButton(onPressed: (){
              bloc.eventSink.add(ColorEvent.light_blue);
            },backgroundColor: Colors.lightBlue,),
          ],
        ),
        appBar: AppBar(
          title: Text("Flutter BLoc Demo"),
        ),
        body: Center(
          child: StreamBuilder(
              initialData: Colors.amber,
              stream: bloc.stateStream,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  width: 100,
                  height: 100,
                  color: snapshot.data,
                );
              }
          ),
        ),
      ),
    );
  }
}