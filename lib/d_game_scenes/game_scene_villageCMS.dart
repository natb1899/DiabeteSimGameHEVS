import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';

import '../a_overlays/a1_game_overlays/a1_1_game_bundles/a1_1_1_game_bundle_left/a1_1_1_1_sound/sound_button_controller.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/chest.dart';
import '../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../z_globals/z1_game_manager.dart';
import '../z_globals/z3_strings_manager.dart';
import 'game_scene_generator.dart';

/// This class defines the game scene of the village
class VillageCMSScene extends DiabeteGameScene {
  bool _chestIsAdded = false;

  bool get chestIsAdded => _chestIsAdded;

  VillageCMSScene(
      {required GameScenesController gameScenesController,
      required GameSoundController gameSoundController,
      required String previousMissionName,
      required String soundTrackName,
      required String sceneName,
      required String sceneTmx})
      : super(
          gameScenesController: gameScenesController,
          gameSoundController: gameSoundController,
          previousMissionName: previousMissionName,
          soundTrackName: soundTrackName,
          sceneName: sceneName,
          sceneTmx: sceneTmx,
        );

  @override
  Future<void>? onLoad() async {
    await initChest();
    await super.onLoad();
    player.canMove = false;
    FlameAudio.bgm.initialize();
  }

  /// Update the scene to make the chest appear when the whole village scene is done.
  @override
  void update(double dt) {
    super.update(dt);
    if (!_chestIsAdded) {
      if (gameScenesController.sceneRouter[GameScenes.atBrocoliHome]!.isDone) {
        add(chest1);
        add(chest2);
        _chestIsAdded = true;
      }
    }

    if ((chest1 as Chest).isOpened && (chest2 as Chest).isOpened) {
      isDone = true;
    }
  }

  /// Initialize the chest and add them to the village scene.
  Future<void> initChest() async {
    final image = await Flame.images.load('gameObjects/bigChest.png');
    chest1 = Chest(
      sprite: Sprite(image),
      size: Vector2.all(32),
      anchor: Anchor.center,
      badgeName: GameChests.chestCMS1BadgeName,
      badgeMessage: GameChests.chestCMS1BadgeMessage,
      badgeType: GameChests.chestCMS1BadgeType,
    );
    chest2 = Chest(
        sprite: Sprite(image),
        size: Vector2.all(32),
        anchor: Anchor.center,
        badgeName: GameChests.chestCMS2BadgeName,
        badgeMessage: GameChests.chestCMS2BadgeMessage,
        badgeType: GameChests.chestCMS2BadgeType);
  }
}
