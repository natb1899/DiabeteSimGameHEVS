import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:seriousgame/a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import 'package:seriousgame/b_game_objects/b1_characters/brocoliHospital.dart';

import '../b_game_objects/b1_characters/brocoli.dart';
import '../b_game_objects/b1_characters/brocoliSon.dart';
import '../b_game_objects/b1_characters/guy01.dart';
import '../b_game_objects/b1_characters/guy02.dart';
import '../b_game_objects/b1_characters/moutarde.dart';
import '../b_game_objects/b1_characters/nurse01.dart';
import '../b_game_objects/b1_characters/player.dart';
import '../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';

abstract class DiabeteGameBase extends FlameGame with SingleGameInstance {
  DiabeteGameBase({
    required this.gameSoundController,
    required this.soundTrackName,
    required this.gameScenesController,
    required this.sceneName,
    required this.previousMissionName,
  });

  // Scene name
  String sceneName;
  String previousMissionName;

  // Sprites
  late SpriteComponent chest1;
  late SpriteComponent chest2;
  late SpriteComponent chest3;
  late SpriteComponent chest4;
  late SpriteComponent chest5;
  late SpriteComponent chest6;
  late SpriteComponent chest7;
  late SpriteComponent chest8;

  // Scene sound
  String soundTrackName;
  bool soundState = false;

  // To allow the perso to change the scene
  bool canChangeScene = true;

  // When the scenario of the scene is done, set to true
  // Logic : Can't return to a scene already done
  bool isDone = false;

  // Player scene
  late final PlayerComponent player;

  // Pnj scene
  late final Brocoli brocoli;
  late final BrocoliHospital brocoliHospital;
  late final BrocoliSon brocoliSon;
  late final Moutarde moutarde;
  late final Nurse01 nurse01;
  late final Guy01 guy01;
  late final Guy02 guy02;

  // Game controller
  GameScenesController gameScenesController;

  // Sound Controller
  GameSoundController gameSoundController;

  // To unlock the badges that the player will get along the game
  bool badgeDiabeteTypeUnlocked = false;
  bool badgeDiabeteComplicationUnlocked = false;

  // Current step in scene
  int currentStep = 0;

  void resumeScene() {}
}
