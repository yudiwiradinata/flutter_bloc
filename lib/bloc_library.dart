import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/color_bloc_lib.dart';

class BlocAppLib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBlocLib>(
          create: (context) => ColorBlocLib(), child: MainPage()),
    );
  }
}
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBlocLib bloc = BlocProvider.of<ColorBlocLib>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              bloc.add(ColorEvent.amber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.add(ColorEvent.lightb_blue);
            },
            backgroundColor: Colors.lightBlue,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("BLoc dengan flutter_bloc Demo"),
      ),
      body: Center(
          child: BlocBuilder<ColorBlocLib, Color>(
        builder: (context, color) => AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: 100,
          height: 100,
          color: color,
        ),
      )),
    );
  }
}
