//ADNAN HASEEB
//21-ARID-4017

import 'package:quizapp/question.dart';

class QuestionBank {
  int count = 0;
  List<Questions> questionbanks = [
    Questions(
        'General relativity accurately describes extreme gravitational behavior.',
        true),
    Questions(
        'Quantum mechanics governs small-scale particle behavior.', false),
    Questions('The speed of light in a vacuum is constant.?', true),
    Questions('Thermodynamics governs heat and energy flow.', true),
    Questions('Dark matter and energy are mysteries.', false),
    Questions('String theory aims to unify fundamental forces.', true),
    Questions('The Standard Model explains particle interactions.', true),
    Questions('Black holes emit no detectable radiatio', false),
    Questions(
        'The uncertainty principle limits particle measurement precision.',
        true),
    Questions('Entanglement links particles properties.', false),
    Questions('Theoretical time travel is possible.', true),
    Questions('The Higgs boson confirms the Higgs fields existence.', false),
    Questions(
        'Dark energy drives the universes accelerating expansion.', false),
    Questions('Gravitational waves were detected in 2015.', true),
    Questions('The Big Bang theory explains the universes origin.', true),
    Questions('Photons transmit electromagnetic force.', false),
    Questions('Parallel universes are speculative.', true),
    Questions('Superconductors have zero resistance at low temps.', true),
    Questions('The Casimir effect demonstrates vacuum fluctuations.', false),
    Questions('Physics laws are consistent across reference frames.', true),
  ];
  void nextQuestion() {
    if (count <= questionbanks.length - 1) {
      count++;
    }
  }

  String? GetQuestion() {
    return questionbanks[count].QuestionState;
  }

  bool? GetAnswer() {
    return questionbanks[count].AnswerState;
  }

  bool? Finish() {
    if (count >= questionbanks.length - 1)
      return true;
    else {
      return false;
    }
  }

  void Reset() {
    count = 0;
  }
}
