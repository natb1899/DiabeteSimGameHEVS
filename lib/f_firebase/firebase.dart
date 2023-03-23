import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seriousgame/f_firebase/user.dart';

import '../a_overlays/a1_game_overlays/a1_1_Login/auth_controller.dart';

//Reference to the collections User and Road
//to read and write data
class DatabaseManager {
  final userRef =
      FirebaseFirestore.instance.collection('User').withConverter<User>(
            fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

  //Get User Role
  Future<String> getUserRole() async {
    final docUser = FirebaseFirestore.instance
        .collection('User')
        .doc(AuthController.instance.auth.currentUser?.uid);

    DocumentSnapshot docU = await docUser.get();
    return docU.get('role');
  }

  //Get User Role
  Future<String> getUserLevel(id) async {
    String userLevel = "null";

    await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .get()
        .then((data) {
      userLevel = data['currentLevel'];
    });

    return userLevel;
  }

  //Add User to the App
  Future<void> addUser({required String email, required String? id}) async {
    final docUser = FirebaseFirestore.instance.collection('User').doc(id);

    final user = {'email': email};

    await docUser.set(user);
  }

  //Save the current game level
  Future<void> saveGame(
      {required String currentLevel,
      required String previousMissionName,
      required String? id}) async {
    final docUser = FirebaseFirestore.instance.collection('user').doc(id);

    final save = {
      'currentLevel': currentLevel,
      'previousMissionName': previousMissionName
    };

    await docUser.set(save);
  }
}
