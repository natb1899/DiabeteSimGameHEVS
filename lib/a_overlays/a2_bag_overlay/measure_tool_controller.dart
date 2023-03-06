import '../../../e_game_controllers/base_controller.dart';
import 'measure_tool_model.dart';

/// controller for mesure tool in the bag
class MeasureToolController extends BaseController {
  List<bool> toolsUsageTrackers = [];
  final Map<String, MeasureToolModel> _measureTools = {
    "Glycomètre": MeasureToolModel(
      name: "Glycomètre",
    ),
    "Thermomètre": MeasureToolModel(
      name: "Thermomètre",
    ),
    "Stethoscope": MeasureToolModel(
      name: "Stethoscope",
    ),
    "Pulsoxymètre": MeasureToolModel(
      name: "Pulsoxymètre",
    ),
    "Tensiomètre": MeasureToolModel(
      name: "Tensiomètre",
    ),
    "Stylo à insuline": MeasureToolModel(
      name: "Stylo à insuline",
    ),
  };

  Map<String, MeasureToolModel> get measureTools => _measureTools;

  @override
  void start() {}

  @override
  void dispose() {}
}
