
import 'package:flutter/cupertino.dart';

class customPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height/3);
    //path.lineTo(size.width - (size.width/4), size.height/3);
    //path.lineTo(size.width, 0);
    path.cubicTo(size.width/3, size.height/3, size.width/2, size.height/4, size.width, size.height/4);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}