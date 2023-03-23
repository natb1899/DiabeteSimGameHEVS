import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seriousgame/e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.gameScenesController}) : super(key: key);
  final GameScenesController gameScenesController;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
           // actions: [
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                    email: _usernameController.text,
                    password: _passwordController.text,
                  );
                  // Navigate to the next screen on successful login
                  //widget.gameScenesController.goToNextScene();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    const Text("Wrong Credentials");
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                    const Text("Wrong Credentials");
                  }
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 8),
            
            TextButton(
              onPressed: () {
                
              //   bool openBag =
              //     gameScenesController.configButtonController.openConfig;
              // gameScenesController.configButtonController.openConfig = !openBag;
              // openBag = !openBag;
              // if (gameScenesController.scene.sceneName ==
              //     GameScenes.startPage) {
              //   gameScenesController.configButtonController.inputConfig
              //       .add(openBag);

              //   gameScenesController.openScene(GameScenes.villageCMS);
              // } else {
              //   gameScenesController.configButtonController.inputConfig.add(
              //       gameScenesController.configButtonController.openConfig);
              // }
              },
              child: const Text('Forgot Password?'),
            )
            ]
//          ],
          
        ),
      ),
    );
  }
}
