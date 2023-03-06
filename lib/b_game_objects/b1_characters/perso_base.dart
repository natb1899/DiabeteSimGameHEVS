import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../../z_globals/z1_game_manager.dart';

/// This class is a template for all characters  (heritage)
class Perso extends SpriteAnimationComponent with CollisionCallbacks {
  Perso({required this.fileNamePngCharacter});

  String fileNamePngCharacter;

// idleAnimation --> positions at the stop of the player
// moveAnimation --> positions when player is moving
  late SpriteAnimation idleDownAnimation;
  late SpriteAnimation idleUpAnimation;
  late SpriteAnimation idleRightAnimation;
  late SpriteAnimation idleLeftAnimation;
  late SpriteAnimation moveDownAnimation;
  late SpriteAnimation moveUpAnimation;
  late SpriteAnimation moveRightAnimation;
  late SpriteAnimation moveLeftAnimation;

//##############################################################################
  // UPDATE SECTION
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    final spriteSheet = await initSprite();
    loadAnimations(spriteSheet);
    animation = idleDownAnimation;
    size = Vector2(GameParams.finalcharacterSize, GameParams.finalcharacterSize);
    add(RectangleHitbox.relative(Vector2(0.4, 0.5),
        parentSize: Vector2(width, height)));
  }

  // END UPDATE SECTION
//##################################################################

  Future<SpriteSheet> initSprite() async {
    return SpriteSheet(
      image: await Flame.images.load("people/$fileNamePngCharacter"),
      srcSize:
          Vector2(GameParams.charactereSprite, GameParams.charactereSprite),
    );
  }

  /// This methode load the annimation of the player in the sprite Sheet
  void loadAnimations(SpriteSheet spriteSheet) {
    idleDownAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: PlayerBehavior.speedOnIdle,
      to: 7,
    );
    idleUpAnimation = spriteSheet.createAnimation(
      row: 1,
      stepTime: PlayerBehavior.speedOnIdle,
      to: 7,
    );
    idleRightAnimation = spriteSheet.createAnimation(
      row: 2,
      stepTime: PlayerBehavior.speedOnIdle,
      to: 7,
    );
    idleLeftAnimation = spriteSheet.createAnimation(
      row: 3,
      stepTime: PlayerBehavior.speedOnIdle,
      to: 7,
    );
    moveDownAnimation = spriteSheet.createAnimation(
      row: 4,
      stepTime: PlayerBehavior.speedOnMove,
      to: 7,
    );
    moveUpAnimation = spriteSheet.createAnimation(
      row: 5,
      stepTime: PlayerBehavior.speedOnMove,
      to: 7,
    );
    moveRightAnimation = spriteSheet.createAnimation(
      row: 6,
      stepTime: PlayerBehavior.speedOnMove,
      to: 7,
    );
    moveLeftAnimation = spriteSheet.createAnimation(
      row: 7,
      stepTime: PlayerBehavior.speedOnMove,
      to: 7,
    );
  }
}
