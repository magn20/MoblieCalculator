class MyStack{
  final _growableList = [];

  pop() => _growableList.removeLast();

  peek() => _growableList.last;

  clear() => _growableList.clear();

  stack() => _growableList.toList();
  void push(input) => _growableList.addAll(input.split(" "));

}