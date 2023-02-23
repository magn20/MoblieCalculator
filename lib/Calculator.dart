
class plus implements command{
  final String num1;
  final String num2;

  plus(this.num1, this.num2);

  execute() => num.parse(this.num2) + num.parse(this.num1);
}

class minus implements command{
  final String num1;
  final String num2;

  minus(this.num1, this.num2);

  execute() => num.parse(this.num2) - num.parse(this.num1);
}
class times implements command{
  final String num1;
  final String num2;

  times(this.num1, this.num2);

  execute() => num.parse(this.num2) * num.parse(this.num1);
}
class divide implements command{
  final String num1;
  final String num2;

  divide(this.num1, this.num2);

  execute() => num.parse(this.num2) / num.parse(this.num1);
}
abstract class command{
  execute();
}
