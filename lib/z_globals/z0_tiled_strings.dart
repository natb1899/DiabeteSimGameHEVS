/// It's in this class that tiled objcets were difined by their group name
class TiledObjectsGroupName {
  static const String obstacles = "Obstacles";
  static const String spawnPoints = "SpawnPoints";
  static const String changeScenePoints = "ChangeScenePoints";
}

/// It's in this class that tiled objcets were difined by their class
class TiledObjectClass {
  // ChangeScenePoints
  static const String changeScene = "ChangeScene";

  // Obstacles
  static const String obstacle = "Obstacle";
  static const String interactive = "Interactive";
  static const String house = "House";

  // SpawnPoints
  static const String spawnPoint = "SpawnPoint";
}

/// It's in this class that tiled objects were defined by their name
class TiledObjectName {
  // Characters (SpawnPoints -> SpawnPoint)
  static const String player = "Player";
  static const String moutarde = "Moutarde";
  static const String brocoli = "Brocoli";
  static const String brocoliHospital = "BrocoliHospital";
  static const String brocoliSon = "BrocoliSon";
  static const String guy01 = "Guy01";
  static const String guy02 = "Guy02";
  static const String nurse01 = "Nurse01";

  //static const String mew = "Mew";

  // Spawnpoint objects (SpawnPoints -> SpawnPoint)
  static const String chest1 = "Chest1";
  static const String chest2 = "Chest2";
  static const String chest3 = "Chest3";
  static const String chest4 = "Chest4";
  static const String chest5 = "Chest5";
  static const String chest6 = "Chest6";
  static const String chest7 = "Chest7";
  static const String chest8 = "Chest8";

  // CMS (Obstacles -> House)
  static const String brocoliHouse = "BrocoliHouse";
  static const String moutardeHouse = "MoutardeHouse";
  static const String myrtilleHouse = "MyrtilleHouse";

  // Interactive objects (Obstacles -> Interactive)
  static const String tv = "TV";
  static const String house = "House";
  static const String fountain = "Fountain";
  static const String fridge = "Fridge";
  static const String pikachu = "Pikachu";
  static const String mew = "Mew";

  // Change scene area (ChangeScenePoints -> ChangeScene)
  //VillageScene
  static const String toVillageCMS = "ToVillageCMS";
  static const String toOutsideHospital = "ToOutsideHospital";
  static const String toMoutardeHouse = "ToMoutardeHouse";
  static const String toBrocoliHouse = "ToBrocoliHouse";
  static const String toBrocoliChamber = "ToBrocoliChamber";
  static const String toInsideHospital = "ToInsideHospital";
  static const String toOutsideBrocoliChamber = "ToOutsideBrocoliChamber";

  //HopitalScene
  //static const String toBrocoliChamber = "ToBrocoliChamber"; -> will be moved here
  static const String toHospitalInterior = "ToHospitalInterior";
}
