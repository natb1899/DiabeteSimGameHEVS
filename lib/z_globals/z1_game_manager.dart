/// It's in this class that the behaviors of the player is managed
class PlayerBehavior {
  static const double speedOnMove = .15;
  static const double speedOnIdle = .2;
  static double strideLenght = 120; // longuer des pas du player (en pixel)
  static const int noCollision = -1;
  static const int initialScore = 50;

  // Movement params
  static const int isIdleDown = 0;
  static const int isIdleUp = 1;
  static const int isIdleRight = 2;
  static const int isIdleLeft = 3;
  static const int isMovingDown = 4;
  static const int isMovingUp = 5;
  static const int isMovingRight = 6;
  static const int isMovingLeft = 7;
}

/// It's in this class that the global game setting is managed
class GameParams {
  static const double smallSize = 30;
  static const double middleSize = 50;
  static const double bigSize = 60;
  static const double spriteSize = 16;
  static const double charactereSprite = 48;
  static const double finalcharacterSize = 80;
}

/// It's in this class that the global scene setting is managed
class GameScenes {
  static const String startPage = "startPage";

  //Level 1 - VillageScene
  static const String villageCMS = "CMS - Village1 -";
  static const String atMoutardeHome =
      "Mission 1 : CMS - Village1 - Moutarde Home";
  static const String atBrocoliHome =
      "Mission 3 : CMS - Village1 - Brocoli Home";

  //Level 2 - HopitalScene
  static const String outsideHospital = "Outside hospital -";
  static const String atHospitalInterior = "HospitalInterior - ";
  static const String atBrocoliChamber =
      "Mission 4 : Hospital - Hospital1 - Brocoli Chamber";
}

/// It's in this class that the bag menu strings are managed
class BagMenu {
  static const String titleWidget = 'Sac à dos';
}

class GameCharacters {
  static const String global = "Global";
  static const String moutarde = "Mr Moutarde";
  static const String myrtille = "Mme Myrtille";
  static const String brocoli = "Mr Brocoli";
  static const String guy01 = "Guy01";
  static const String guy02 = "Guy02";
  static const String nurse01 = "Nurse01";
}

class GameInteractionTypes {
  static const String notes = "notes";
  static const String contacts = "contacts";
  static const String tools = "tools";
  static const String endScenes = "endScenes";
  static const String feedback = "feedback";
}
