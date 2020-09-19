class ClientModel{
  String name;
  String adresse;

  ClientModel({this.name, this.adresse});

  ClientModel.fromJson(Map<String,dynamic> json){
    name = json['full_name'];
    adresse = json['adresse'];
  }

}