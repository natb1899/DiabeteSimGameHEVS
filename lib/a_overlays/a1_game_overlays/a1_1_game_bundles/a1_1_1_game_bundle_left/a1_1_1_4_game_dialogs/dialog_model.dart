/// different types of dialogue
enum DialogType {
  display,
  questionCheckbox,
  questionRadioButton,
  questionInput
}

/// pattern for dialogue
class DialogModel {
  bool isShowDialog;
  DialogType? dialogType;
  String? dialogMessage;
  bool hasNext;
  bool hasQuestion;
  String? questionTitle;
  String? question;
  List<Map<String, dynamic>>? questions;
  int? index;
  String? falseAswers;
  String? falseAswersContent;
  String? falseAswersContentbutnoLose;
  String? trueAswers;
  String? trueAswersContent;
  bool retry;
  bool? hasInteraction;
  List<List<dynamic>>? dialogInteractions;

  DialogModel({
    required this.isShowDialog,
    this.dialogMessage,
    this.dialogType = DialogType.display,
    this.hasNext = false,
    this.hasQuestion = false,
    this.questionTitle,
    this.question,
    this.questions,
    this.index,
    this.falseAswers,
    this.falseAswersContent,
    this.falseAswersContentbutnoLose,
    this.retry = false,
    this.trueAswers,
    this.trueAswersContent,
    this.hasInteraction = false,
    this.dialogInteractions,
  });

  List<dynamic> get questioAnswer =>
      questions!.map((answer) => answer["result"]).toList();
}
