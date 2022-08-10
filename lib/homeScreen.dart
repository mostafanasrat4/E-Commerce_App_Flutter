import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color container1Color = Colors.blue;
  Color container2Color = Colors.red;
  Color container3Color = Colors.amber;
  


  List<Color> myColorsList = [Colors.black, Colors.white, Colors.blue, Colors.red, Colors.orange, Colors.lime, Colors.brown, Colors.blueGrey];

  void _changeContainerColor(x) {
    
    setState(() {
      myColorsList.shuffle();
        Color randomColor = myColorsList[0];
        switch (x) {
          case 1:
            container1Color = randomColor;
            break;
          case 2:
            container2Color = randomColor;
            break;
          case 3:
            container3Color = randomColor;
            break;
          default:
        }
    });
  }

  Widget _createContainer(clr, text){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      color: clr,
      child: Center( 
        child: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white,
          ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            //onTap: _changeContainer3Color,
            onTap: (){
              _changeContainerColor(1);
            },
            child: _createContainer(container1Color, '1')
            ),
          InkWell(
            //onTap: _changeContainer3Color,
            onTap: (){
              _changeContainerColor(2);
            },
            child: _createContainer(container2Color, '2')
          ),
          InkWell(
            onTap: (){
              _changeContainerColor(3);
            },
            child: _createContainer(container3Color, '3')
          )
        ],
      )
    )
    ;
  }
}
