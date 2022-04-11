import 'package:flutter/material.dart';
import 'package:sios2api/design/customPath.dart';

class backGround extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return backGroundState();
  }

}

class backGroundState extends State<backGround>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }


  Widget bodyPage(){
    return ClipPath(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width : MediaQuery.of(context).size.width,
        color: Colors.red,
      ),
      clipper: customPath(),
    );



  }

}