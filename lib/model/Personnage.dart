
class Personnage {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Map origin;
  late String image;


  Personnage.json(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    status = map['status'];
    species = map['species'];
    type = map['type'];
    gender = map['gender'];
    origin = map['origin'];
    image = map['image'];
  }
}