// import 'dart:developer';
// import 'package:seriousgame/f_firebase/user.dart';


// //Reference to the collections User and Road
// //to read and write data
// class DatabaseManager {

//   final userRef =
//       FirebaseFirestore.instance.collection('User').withConverter<User>(
//             fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
//             toFirestore: (user, _) => user.toJson(),
//           );




//   //Add User to the App
//   Future<void> addUser({required String email, required String? id}) async {
//     final docUser = FirebaseFirestore.instance.collection('User').doc(id);

//     final user = {
//       'email': email,
//       'favoriteRoads': [],
//       'firstName': '',
//       'myRoads': [],
//       'name': '',
//       'position': 'position',
//       'role': 'user',
//     };

//     await docUser.set(user);
//   }

// }