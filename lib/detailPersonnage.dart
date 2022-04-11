import 'package:flutter/material.dart';
import 'package:sios2api/model/Personnage.dart';

class detailPersonnage extends StatefulWidget{
  Personnage personnage;
  detailPersonnage({required Personnage this.personnage});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailPersonnageState();
  }

}

class detailPersonnageState extends State<detailPersonnage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: bodyPage(),
      )

    );
  }


  Widget bodyPage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Image
        Hero(
            tag: "${widget.personnage.id}",
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(widget.personnage.image)
                  )
              ),
            ),
        ),
        SizedBox(height: 10,),
        Text('${widget.personnage.name}'),
        SizedBox(height: 10,),
        Text('${widget.personnage.species}'),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (widget.personnage.gender =='Male')?Icon(Icons.male):Icon(Icons.female),
            Text('${widget.personnage.gender}'),
          ],
        ),
        SizedBox(height: 10,),
        Text('${widget.personnage.type}'),
        SizedBox(height: 10,),
        Text('${widget.personnage.status}'),


      ],
    );
  }

}