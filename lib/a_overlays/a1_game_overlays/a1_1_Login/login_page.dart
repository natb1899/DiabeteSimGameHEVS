import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seriousgame/d_game_scenes/game_base.dart';
import 'package:seriousgame/e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import 'package:seriousgame/e_game_controllers/e_2_score_controller/player_score_controller.dart';
import 'package:seriousgame/f_firebase/firebase.dart';

import '../../../z_globals/z1_game_manager.dart';

class LoginPage extends StatefulWidget {
  final DiabeteGameBase game;
  final GameScenesController gameScenesController;
  final PlayerScoreController playerScoreController;

  const LoginPage({
    Key? key,
    required this.game,
    required this.gameScenesController,
    required this.playerScoreController,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController(text: "daniel@test.ch");
  final TextEditingController _passwordController =
      TextEditingController(text: "123456");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                    email: _usernameController.text,
                    password: _passwordController.text,
                  );

                  FirebaseAuth auth = FirebaseAuth.instance;
                  DatabaseManager db = DatabaseManager();

                  String currentWorld;

                  List<String> asyncList =
                      await db.getUserLevel(auth.currentUser?.uid);

                  if (asyncList.isNotEmpty) {
                    for (String item in asyncList) {
                      widget.game.gameScenesController.sceneRouter[item]!
                          .isDone = true;
                    }
                  }

                  if (asyncList.contains("Outside hospital -")) {
                    currentWorld = GameScenes.atHospitalInterior;
                  } else {
                    currentWorld = GameScenes.villageCMS;
                  }

                  widget.game.gameScenesController.openScene(currentWorld);

                  //widget.gameScenesController.openScene(userLevel);
                  //widget.gameScenesController.goToScene(userLevel);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found' ||
                      e.code == 'wrong-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Wrong Credentials'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            )
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return "Enter Email Address";
  }
  return null;
}
