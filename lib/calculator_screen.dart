import 'package:flutter/material.dart';
import 'package:mobliecalculator/Stack.dart';
import 'package:mobliecalculator/my_home_page.dart';

import 'Calculator.dart';

class CalculatorScreen extends State<MyHomePage> {
  String output = "";
  String result = "";
  var resultList = [];

  var num1;
  var num2;

  MyStack stack = MyStack();

  void insertInput(input) {
    setState(() {
      this.output += input;
    });
  }

  void backspace() {
    setState(() {
      this.output = output.substring(0, output.length - 1);
    });
  }

  calculate(input) {
    final commands = {
      "+": plus(num1, num2),
      "-": minus(num1, num2),
      "*": times(num1, num2),
      "/": divide(num1, num2)
    };

    final command = commands[input]?.execute();
    stack.push(command.toString());
  }

  void enter(input) {
    setState(() {
      bool isNumeric = num.tryParse(input!) != null;

      // checks for operator
      var isOperator =
          ["*", "+", "-", "/"].any((element) => input.contains(element));

      if (isNumeric) {
        stack.push(input);
        output = "";
        result = stack.stack().toString();
      }

      if (isOperator) {
        // finds the numbers from the stack
        List stackList = stack.stack();
        if (stackList.length > 1) {
          num1 = stack.peek();
          stack.pop();
          num2 = stack.peek();
          stack.pop();
          calculate(input);
          result = stack.stack().toString();
          output = "";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Magnus RPN Calculator",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        body: Column(
          children: [buildScreen(), buildCalculator()],
        ));
  }

  Row buildCalculator() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildNumberAutomatic(), buildOperations()],
    );
  }

  Widget buildScreen() {
    return Expanded(
        child: Column(
      children: [
          Expanded(
              child: ListView(reverse: true,
                padding : EdgeInsets.only(top: 50),
                children: List.generate(
                  stack.stack().length,
                      (index) {
                    return Align(alignment: Alignment.bottomRight,child: Text(stack.stack()[index], style: TextStyle(fontSize: 30),));
                  },
                ).reversed.toList(),
              ),
          ),
          Align(alignment: Alignment.bottomRight,
            child: Text(
              "$output",
              style: TextStyle(fontSize: 30),
            ),
          ),
      ],
    ));
  }

  Expanded buildOperations() {
    return Expanded(
      flex: 2,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: 1,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black12),
                onPressed: () {
                  backspace();
                },
                child: const Icon(Icons.backspace),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black12),
                onPressed: () {
                  insertInput("+");
                },
                child: const Text(
                  "+",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black12),
                onPressed: () {
                  insertInput("-");
                },
                child: const Text(
                  "-",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black12),
                onPressed: () {
                  insertInput("*");
                },
                child: const Text(
                  "*",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black12),
                onPressed: () {
                  insertInput("/");
                },
                child: const Text(
                  "/",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.black12),
                onPressed: () {
                  setState(() {
                    stack.clear();
                    output = "";
                    result = "";
                  });
                },
                child: const Text(
                  "c",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildNumberAutomatic() {
    return Expanded(
      flex: 8,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 12,
        itemBuilder: (context, index) {
          var num = index;
          num++;
          if (index == 9) {
            return Divider();
          }
          if (index == 10) {
            num = 0;
          }
          if (index == 11) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    enter(output);
                  },
                  child: const Text(
                    "Enter",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            );
          }

          return Container(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton( style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  insertInput(num.toString());
                },
                child: Text(
                  "$num",
                  style: TextStyle(fontSize: 55),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
