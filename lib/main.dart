import 'package:flutter/material.dart';
import 'package:sios2api/background.dart';
import 'package:sios2api/detailPersonnage.dart';
import 'package:sios2api/model/Personnage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Variable
  List <Personnage> listePersonnage = [];
  late var jsonResponse;
  String apiAdresse = "https://rickandmortyapi.com/api/character";



  ///
  ///
  ///
  ///Méthode
  Future init(String adresseUrl) async {
    Uri url = Uri.parse(adresseUrl);
    var responseAdresse = await http.get(url);
    jsonResponse = convert.jsonDecode(responseAdresse.body) as Map<String,dynamic>;
    int index = 0;
    while(index<jsonResponse["results"].length){
      setState(() {
        Personnage personnage = Personnage.json(jsonResponse["results"][index] as Map<String,dynamic>);
        listePersonnage.add(personnage);
      });
      index++;
    }
    if(jsonResponse['info']['next']!=null){
      init(jsonResponse["info"]['next']);
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    init(apiAdresse);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [
          backGround(),
          Container(
            padding: EdgeInsets.all(10),
            child: bodyPage(),
          )

        ],
      )



      
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget bodyPage(){
    return GridView.builder(
      itemCount: listePersonnage.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5),
        itemBuilder: (context,index){
        return
        InkWell(
          child: Hero(
            tag: '${listePersonnage[index].id}',
            child:  Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(listePersonnage[index].image),
                      fit: BoxFit.fill
                  )

              ),

            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return detailPersonnage(personnage: listePersonnage[index]);
                }
            ));
          },
        );

        }
    );
  }
}
