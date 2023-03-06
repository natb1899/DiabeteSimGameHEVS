import 'package:flutter/material.dart';

import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z5_color_manager.dart';
import '../../z_globals/z8_font_manager.dart';
import '../../z_globals/z9_ui_values_manager.dart';

class ParamsOverlay extends StatelessWidget {
  const ParamsOverlay({super.key, required this.gameScenesController});
  final GameScenesController gameScenesController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PARAMETER : '),
        centerTitle: false,
        elevation: GameSize.s4,
        actions: [
          TextButton(
            onPressed: () {
              bool openBag =
                  gameScenesController.configButtonController.openConfig;
              gameScenesController.configButtonController.openConfig = !openBag;
              openBag = !openBag;
              if (gameScenesController.scene.sceneName ==
                  GameScenes.startPage) {
                gameScenesController.configButtonController.inputConfig
                    .add(openBag);

                gameScenesController.openScene(GameScenes.villageCMS);
              } else {
                gameScenesController.configButtonController.inputConfig.add(
                    gameScenesController.configButtonController.openConfig);
              }
            },
            child: const Text(
              "PLAY ->",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSpeedSlider(),
            ],
          ),
        ),
      ),
      backgroundColor: ColorManager.lightGrey,
    );
  }

  Widget _buildSpeedSlider() {
    final labels = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
    int spedMin = 0;

    return SizedBox(
        width: double.infinity,
        child: SliderTheme(
          data: SliderThemeData(
            activeTrackColor: ColorManager.darkPrimary,
            inactiveTrackColor: ColorManager.primary,
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: ColorManager.darkPrimary,
            thumbColor: ColorManager.darkPrimary,
            trackHeight: 16,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
            overlayColor: Colors.white70,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...modelBuilder(labels, (index, label) {
                      return buildLabel(
                        label: label,
                      );
                    })
                  ],
                ),
              ),
              Slider(
                  label: "PLAYER SPEED",
                  min: 0,
                  max: 10,
                  divisions: 9,
                  value: 5,
                  onChanged: (double value) {}),
            ],
          ),
        ));
  }

  List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  Widget buildLabel({String label = ""}) {
    return SizedBox(
      width: 25,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: ColorManager.appPurpleColor,
            fontSize: GameSize.s16,
            fontFamily: FontFamily.pixelSansSerif),
      ),
    );
  }
}
