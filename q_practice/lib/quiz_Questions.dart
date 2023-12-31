class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    List<String> shuffledAnswers = List.from(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
