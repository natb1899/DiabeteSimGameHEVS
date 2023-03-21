class User {
  User(
      {required this.email,
      required this.firstName,
      required this.name});

  final String email;
  final String firstName;
  final String name;


  //Translates the information from Json
  factory User.fromJson(Map<String, dynamic> json) => User(
    email : json['email'] as String,
      firstName : json['firstName'] as String,
      name: json['name'] as String);


  Map<String, dynamic> toJson() => _userToJson(this);

}

//Translates the information to Json
Map<String, dynamic> _userToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'name': instance.name,
    };

// //List all the roads from favoriteRoads
// List<Map<String, dynamic>>? _favoriteRoads(List<Road>? roads) {
//   if (roads == null) {
//     return null;
//   }
//   final roadMap = <Map<String, dynamic>>[];
//   roads.forEach((road) {
//     roadMap.add(road.toJson());
//   });
//   return roadMap;
// }

// //List all the Roads 
// List<Map<String, dynamic>>? _myRoadsList(List<Road>? roads) {
//   if (roads == null) {
//     return null;
//   }
//   final roadMap = <Map<String, dynamic>>[];
//   roads.forEach((road) {
//     roadMap.add(road.toJson());
//   });
//   return roadMap;
// }