class Lottery {
  String contest;
  String date;
  int one;
  int two;
  int three;
  int four;
  int five;
  int six;

  Lottery({
    required this.contest,
    required this.date,
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
    required this.six,
  });

  @override
  String toString() {
    return 'contest: $contest date: $date one: $one two: $two three: $three: four: $four five: $five six: $six';
  }
}
