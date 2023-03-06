import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/foundation.dart';
import 'package:tiled/tiled.dart';

import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/change_scene.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/fountain.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/house.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/mew.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/moutardeFridge.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/tv.dart';
import '../b_game_objects/b2_map_objects/b2_2_obstacles/obstacle.dart';
import '../b_game_objects/b2_map_objects/map_object.dart';
import '../d_game_scenes/game_scene_generator.dart';
import '../z_globals/z0_tiled_strings.dart';
import '../z_globals/z1_game_manager.dart';
import '../z_globals/z3_strings_manager.dart';

/// Loader for game scene changes
class GameSceneLoader {
  static void loadSceneComponents({
    required TiledComponent sceneMap,
    required DiabeteGameScene game,
  }) {
    for (String objectsGroupName in tiledObjectsGroupsNames) {
      ObjectGroup? loadedObjectsGroup =
          sceneMap.tileMap.getLayer<ObjectGroup>(objectsGroupName);
      switch (loadedObjectsGroup!.name) {
        case TiledObjectsGroupName.obstacles:
          loadObstacles(loadedObjectsGroup, game);
          break;
        case TiledObjectsGroupName.spawnPoints:
          loadSpawnPoints(loadedObjectsGroup, game);
          break;
        case TiledObjectsGroupName.changeScenePoints:
          loadChangeScenes(loadedObjectsGroup, game);
          break;
        default:
      }
    }
  }

  //##############################################
  // LOADING OBSTACLES SECTION
  /// Parent method to load all types of obstacles from Tiled
  static void loadObstacles(ObjectGroup obstaclesGroup, DiabeteGameScene game) {
    for (var obstacle in obstaclesGroup.objects) {
      switch (obstacle.class_) {
        case TiledObjectClass.obstacle:
          game.addToScene(
            initObject(
              Obstacle(
                  isHavaingCollisionShapePolygone: false,
                  polygonePoints: obstacle.polygon),
              obstacle,
            ),
          );

          break;
        case TiledObjectClass.interactive:
          loadInteractiveObject(obstacle, game);
          break;
        case TiledObjectClass.house:
          loadHouse(obstacle, game);
          break;
        default:
      }
    }
  }

  /// Load interactive object from Tiled
  static void loadInteractiveObject(
      TiledObject interactive, DiabeteGameScene game) {
    switch (interactive.name) {
      case TiledObjectName.tv:
        game.addToScene(
          initObject(
            TV(
                isHavaingCollisionShapePolygone: false,
                polygonePoints: interactive.polygon),
            interactive,
          ),
        );
        break;
      case TiledObjectName.fountain:
        game.addToScene(
          initObject(
            Fountain(
                isHavaingCollisionShapePolygone: false,
                polygonePoints: interactive.polygon),
            interactive,
          ),
        );
        break;
      case TiledObjectName.fridge:
        game.addToScene(
          initObject(
            Fridge(
                isHavaingCollisionShapePolygone: false,
                polygonePoints: interactive.polygon),
            interactive,
          ),
        );
        break;
      case TiledObjectName.mew:
        game.addToScene(
          initObject(
            Mew(
                isHavaingCollisionShapePolygone: false,
                polygonePoints: interactive.polygon),
            interactive,
          ),
        );
        break;
      default:
    }
  }

  /// Load house object from Tiled
  static void loadHouse(TiledObject house, DiabeteGameScene game) {
    switch (house.name) {
      case TiledObjectName.brocoliHouse:
        game.addToScene(
          initObject(
            House(
                collisionMessage: MapCollisionInteractWith.brocoliHouse,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: house.polygon),
            house,
          ),
        );
        break;
      case TiledObjectName.moutardeHouse:
        game.addToScene(
          initObject(
            House(
                collisionMessage: MapCollisionInteractWith.moutardeHouse,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: house.polygon),
            house,
          ),
        );
        break;
      case TiledObjectName.myrtilleHouse:
        game.addToScene(
          initObject(
            House(
                collisionMessage: MapCollisionInteractWith.myrtilleHouse,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: house.polygon),
            house,
          ),
        );
        break;
      default:
    }
  }

  //######################################################

  //##############################################
  // LOADING SPAWN POINTS SECTION
  /// Load spawn points from Tiled
  static void loadSpawnPoints(
      ObjectGroup spawnPointsGroup, DiabeteGameScene game) {
    for (var spawnPoint in spawnPointsGroup.objects) {
      switch (spawnPoint.name) {

        ///Player and NPC spawn points
        case TiledObjectName.player:
          game.player.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.player);
          break;
        case TiledObjectName.moutarde:
          game.moutarde.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.moutarde);
          break;
        case TiledObjectName.brocoli:
          game.brocoli.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.brocoli);
          break;
        case TiledObjectName.brocoliHospital:
          game.brocoliHospital.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.brocoliHospital);
          break;
        case TiledObjectName.brocoliSon:
          game.brocoliSon.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.brocoliSon);
          break;
        case TiledObjectName.nurse01:
          game.nurse01.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.nurse01);
          break;
        case TiledObjectName.guy01:
          game.guy01.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.guy01);
          break;
        case TiledObjectName.guy02:
          game.guy02.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.guy02);
          break;

        /// Object
        case TiledObjectName.chest1:
          game.chest1.position = Vector2(spawnPoint.x, spawnPoint.y);
          break;
        case TiledObjectName.chest2:
          game.chest2.position = Vector2(spawnPoint.x, spawnPoint.y);
          break;
        case TiledObjectName.chest3:
          game.chest3.position = Vector2(spawnPoint.x + 12, spawnPoint.y + 12);
          break;
        case TiledObjectName.chest4:
          game.chest4.position = Vector2(spawnPoint.x + 12, spawnPoint.y + 12);
          break;
        case TiledObjectName.chest5:
          game.chest5.position = Vector2(spawnPoint.x + 12, spawnPoint.y + 12);
          break;
        case TiledObjectName.chest6:
          game.chest6.position = Vector2(spawnPoint.x + 12, spawnPoint.y + 12);
          break;
        case TiledObjectName.chest7:
          game.chest7.position = Vector2(spawnPoint.x + 12, spawnPoint.y + 12);
          break;
        case TiledObjectName.chest8:
          game.chest8.position = Vector2(spawnPoint.x + 12, spawnPoint.y + 12);
          break;
        default:
      }
    }
  }

  //######################################################

  //##############################################
  // LOADING CHANGE SCENES SECTION
  /// Load changing scenes objects from Tiled
  static void loadChangeScenes(
      ObjectGroup changeScenesGroup, DiabeteGameScene game) {
    for (var changeScene in changeScenesGroup.objects) {
      switch (changeScene.name) {
        //Level 1 ########################################################
        case TiledObjectName.toVillageCMS:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.villageCMS,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );
          break;
        case TiledObjectName.toMoutardeHouse:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.atMoutardeHome,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );
          break;
        case TiledObjectName.toBrocoliHouse:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.atBrocoliHome,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );
          break;
        //Level 2 ########################################################
        case TiledObjectName.toOutsideHospital:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.outsideHospital,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );
          break;
        case TiledObjectName.toBrocoliChamber:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.atBrocoliChamber,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );
          break;
        case TiledObjectName.toHospitalInterior:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.atHospitalInterior,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );
          break;
        case TiledObjectName.toOutsideBrocoliChamber:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.atHospitalInterior,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );
          break;
        default:
      }
    }
  }

  //######################################################

  /// Component initialisation
  static MapObject initObject(MapObject mapObject, TiledObject object) {
    return mapObject
      ..position = Vector2(object.x, object.y)
      ..width = object.width
      ..height = object.height
      ..debugMode = kDebugMode; // Only true on debug mode (dev work)
  }

  /// List of Tiled mapping
  static List<String> tiledObjectsGroupsNames = [
    TiledObjectsGroupName.obstacles,
    TiledObjectsGroupName.spawnPoints,
    TiledObjectsGroupName.changeScenePoints,
  ];
}
