class GameDialogs {
  // Basic dialogs
  static const String initialVillageMesssage =
      'Bonjour, je suis un futur ange de la bienveillante haute école de sante du Valais.\n\n'
      'Le diabète est un fléau qui ne cesse d\'augmenter.'
      ' Dans ce monde virtuel je vais apprendre comment le contrer'
      ' et protéger mon prochain atteint. '
      '\n\nOn y GO!?';

  static const String returnToDefaultScene =
      'Vous ne pouvez pas re-effectuer cette scène.';

  static const String cantLeaveScene =
      'Vous devez terminer la mission avant de sortir.';
  static const String returnToMoutardeHome =
      'Vous avez déjà rendu visite à Mr Moutarde.';
  static const String returnToVillageCMS =
      'Vous avez déjà fini votre travail au CMS.';
  static const String finishCMSBefore =
      'Vous devez terminer votre travail au CMS avant d\'accéder à l\'hôpital.';
  static const String unlockCMSChestsBefore =
      'Vous devez ouvrir tous les coffres du CMS avant d\'accéder à l\'hôpital.';
  static const String visitMoutardeBefore =
      'Vous devez rendre visite à Mr Moutarde avant.';

  // Dialogs
  static const String initialBrocoliHome = 'Début de la mission 3 :\n\n'
      'Bienvenue dans la maison de M. Brocoli!.\n'
      'Dirigez-vous vers le patient pour commencer la mission.\n'
      '\n\nOn y GO!?';

  // Transmissions
  static const String transmissionBrocoli =
      'De nouvelles transmissions écrites sont disponibles dans les notes chez Monsieur Brocoli.';
  static const String transmissionMoutarde =
      'De nouvelles transmissions écrites sont disponibles dans les notes chez Monsieur Moutarde.';
}

class GameChests {
  // Village CMS
  static const String chestCMS1BadgeName = 'types de diabète';
  static const String chestCMS1BadgeMessage =
      'Il existe trois types de diabète.'
      '\nLe diabète de type I, de type II ainsi que le diabète gestationnel.';
  static const String chestCMS1BadgeType = 'diabeteType';
  static const String chestCMS2BadgeName = 'complications du diabète';
  static const String chestCMS2BadgeMessage = 'L’OMS estime que 250'
      '000 amputations des membres inférieurs sont réalisées chaque année en Europe.'
      '\nElles sont l’une des conséquences des complications sur le long terme du diabète.';
  static const String chestCMS2BadgeType = 'diabeteComplication';
}

/// It's in this class that dialog with collision were defined
class MapCollisionInteractWith {
  static const String moutardeHouse =
      "J'espère que Monsieur Moutarde va bien !";
  static const String myrtilleHouse =
      "Faut pas que j'oublie de prendre des nouvelles de Madame Myrtille.";
  static const String brocoliHouse =
      "Ce serait bien de faire des brocolis pour ce soir.";
}

/// It's in this class that the planning is defined
class Planning {
  static const String patientsTitle = "Patients du village";
  static const String patient1 = "Patient 1 – 8h00-9h00 – Monsieur Moutarde";
  static const String patient2 = "Patient 2 – 9h00-10h00 – Madame Myrtille";
  static const String patient3 = "Patient 3 – 10h00-11h00 – Monsieur Brocoli";
  static const String chambresTitle = "Chambres des patients a l'hôpital";
  static const String chambre23 = "Chambre 23 – Monsieur Brocoli";
  static const String chambre24 = "Chambre 24 – Monsieur Fraiseux";
  static const String chambre25 = "Chambre 25 – Madame Laitue";
  static const String chambre26 = "Chambre 26 – Monsieur Abricot";
}

/// It's in this class that the Patients situation are defined
class PatientsSituation {
  static const String patientsSituationTitle = "Situations des patients";
  static const String patientsSituation1 = "Patient 1 – Monsieur Moutarde";
  static const String patientsSituation1Desc =
      "Agé de 72 ans. Il est veuf, sans enfant et vit seul à domicile. Après avoir été diagnostiqué d’un diabète de type II à l’hôpital, il est de retour à domicile depuis la veille au soir. C’est le premier matin où il doit gérer seul ses auto-soins. Vous êtes chargée de poursuivre l’enseignement thérapeutique à domicile. ";
  static const String patientsSituation2 = "Patient 2 – Madame Myrtille";
  static const String patientsSituation2Desc =
      "Agée de 88 ans. Elle vit avec son mari et elle est non-adhérente à son traitement antidiabétique oral.  C’est une patiente non-connue du CMS jusqu’à présent. Vous vous rendez à son domicile pour effectuer une première évaluation. ";
  static const String patientsSituation3 = "Patient 3 – Monsieur Brocoli";
  static const String patientsSituation3Desc =
      "Agée 84 ans, veuf, connu pour un diabète de type II traité par antidiabétique oral. Malgré son âge avancé, Monsieur Brocoli ne présente pas de trouble cognitif. Cependant, il a un fort caractère et n’apprécie pas recevoir des recommandations du personnel médical et infirmier, il n’adhère pas toujours au traitement et aux auto-soins.Vous vous rendez chez Monsieur Brocoli pour un contrôle de santé hebdomadaire. Ce jour-là, le fils est présent, il aimerait vous consulter car il est inquiet de l’état général de son papa qui diminue de jour en jour depuis une semaine. ";
}
