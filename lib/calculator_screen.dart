import 'package:flutter/material.dart';
import 'package:mobliecalculator/Stack.dart';
import 'package:mobliecalculator/my_home_page.dart';

import 'Calculator.dart';

class CalculatorScreen extends State<MyHomePage> {
  String output = "";
  String result = "";

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
          "$output",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        actions: [
          Text(
            "$result",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 8,
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("1");
                      },
                      child: const Text(
                        "1",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("2");
                      },
                      child: const Text(
                        "2",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("3");
                      },
                      child: const Text(
                        "3",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("4");
                      },
                      child: const Text(
                        "4",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("5");
                      },
                      child: const Text(
                        "5",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("6");
                      },
                      child: const Text(
                        "6",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("7");
                      },
                      child: const Text(
                        "7",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("8");
                      },
                      child: const Text(
                        "8",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("9");
                      },
                      child: const Text(
                        "9",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        insertInput("0");
                      },
                      child: const Text(
                        "0",
                        style: TextStyle(fontSize: 55),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        enter(output);
                      },
                      child: const Text(
                        "Enter",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 1,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                    child: ElevatedButton(
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
          )
        ],
      ),
    );
  }
}
