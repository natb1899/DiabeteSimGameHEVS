import 'package:flame/components.dart';
import 'package:flutter/services.dart';

import './perso_base.dart';
import '../../d_game_scenes/game_scene_generator.dart';
import '../../z_globals/z1_game_manager.dart';

/// This class manager the player (main character). Player componant inherits from perso (perso_base.dart)
class PlayerComponent extends Perso with HasGameRef<DiabeteGameScene> {
  PlayerComponent(String fileNamePngCharacter)
      : super(fileNamePngCharacter: fileNamePngCharacter);

  bool canMove = true;
  int playerMovementDirection = PlayerBehavior.isIdleDown;
  int collisionDirection = PlayerBehavior.noCollision;
  late double mapWidth;
  late double mapHeight;

  /// This methode update the apparance of the player depending the animation (4 position when move, 4 position when idle)
  @override
  void update(double dt) async {
    if (canMove) {
      moveAnimation(dt: dt);
    } else {
      idleAnimation();
    }
    super.update(dt);
  }

  /// This methode change the attribut "animation" when player is moving depending playing behavior (z1_game_manager.dart)
  void moveAnimation({double? dt}) {
    switch (playerMovementDirection) {
      case PlayerBehavior.isIdleDown:
        animation = idleDownAnimation;
        break;
      case PlayerBehavior.isIdleUp:
        animation = idleUpAnimation;
        break;
      case PlayerBehavior.isIdleRight:
        animation = idleRightAnimation;
        break;
      case PlayerBehavior.isIdleLeft:
        animation = idleLeftAnimation;
        break;
      case PlayerBehavior.isMovingDown:
        animation = moveDownAnimation;
        y += y < mapHeight - height &&
                collisionDirection != PlayerBehavior.isMovingDown
            ? dt! * PlayerBehavior.strideLenght
            : PlayerBehavior.isIdleDown;
        break;
      case PlayerBehavior.isMovingUp:
        animation = moveUpAnimation;
        y -= y > 0 && collisionDirection != PlayerBehavior.isMovingUp
            ? dt! * PlayerBehavior.strideLenght
            : PlayerBehavior.isIdleDown;
        break;
      case PlayerBehavior.isMovingRight:
        animation = moveRightAnimation;
        x += x < mapWidth - width &&
                collisionDirection != PlayerBehavior.isMovingRight
            ? dt! * PlayerBehavior.strideLenght
            : PlayerBehavior.isIdleDown;
        break;
      case PlayerBehavior.isMovingLeft:
        animation = moveLeftAnimation;
        x -= x > 0 && collisionDirection != PlayerBehavior.isMovingLeft
            ? dt! * PlayerBehavior.strideLenght
            : PlayerBehavior.isIdleDown;
        break;
      default:
    }
  }

  /// This methode change the attribut "animation" when player is stopping depending playing behavior (z1_game_manager.dart)
  void idleAnimation() {
    switch (playerMovementDirection) {
      case PlayerBehavior.isMovingDown:
        playerMovementDirection = PlayerBehavior.isIdleDown;
        animation = idleDownAnimation;
        break;
      case PlayerBehavior.isMovingUp:
        playerMovementDirection = PlayerBehavior.isIdleUp;
        animation = idleUpAnimation;
        break;
      case PlayerBehavior.isMovingRight:
        playerMovementDirection = PlayerBehavior.isIdleRight;
        animation = idleRightAnimation;
        break;
      case PlayerBehavior.isMovingLeft:
        playerMovementDirection = PlayerBehavior.isMovingLeft;
        animation = idleLeftAnimation;
        break;
      default:
    }
  }

  /// This methode initialize commands to move the player
  void setOnMovePlayerDirection(Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      playerMovementDirection = PlayerBehavior.isMovingDown;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      playerMovementDirection = PlayerBehavior.isMovingUp;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      playerMovementDirection = PlayerBehavior.isMovingRight;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      playerMovementDirection = PlayerBehavior.isMovingLeft;
    }
  }

  /// This methode initialize idle positions
  void setOnIdlePlayerDirection() {
    switch (playerMovementDirection) {
      case PlayerBehavior.isMovingDown:
        playerMovementDirection = PlayerBehavior.isIdleDown;
        break;
      case PlayerBehavior.isMovingUp:
        playerMovementDirection = PlayerBehavior.isIdleUp;
        break;
      case PlayerBehavior.isMovingRight:
        playerMovementDirection = PlayerBehavior.isIdleRight;
        break;
      case PlayerBehavior.isMovingLeft:
        playerMovementDirection = PlayerBehavior.isIdleLeft;
        break;
      default:
        playerMovementDirection = PlayerBehavior.isIdleDown;
    }
  }
}
