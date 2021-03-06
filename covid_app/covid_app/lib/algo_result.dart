import 'dart:math';

import 'package:covid_app/shared_prefs.dart';

class AlgoResult {
  String name;
  double score;
  double emotionScore;
  int level;

  AlgoResult(this.name, this.score, this.level);

  Map<String, dynamic> toMap() {
    return {"name": name, "score": score, "level": level};
  }

  AlgoResult.fromJson(dynamic jsonObject) {
    name = jsonObject["name"];
    score = jsonObject["score"];
    level = jsonObject["level"];
  }

  String getDisplayName() {
    if (sharedPrefs.presentationMode) {
      Random rand = Random();
      return "User " + rand.nextInt(1000).toString();
    } else
      return name;
  }
}
