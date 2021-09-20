import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:coffee/Storage/coffee_boxes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  final box = CoffeeBox();

  void decrement() {
    setState(() {
      int num = box.getToday();
      if (num > 0) {
        box.setToday(num - 1);
      }
    });
  }

  void increment() {
    setState(() {
      int num = box.getToday();
      box.setToday(num + 1);
    });
  }

  int getYesterday() {
    DateTime d = DateTime.now();
    d = DateUtils.addDaysToDate(d, -1);
    return box.getCoffeeFromDate(d);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covfefe"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              const Text("Coffees today: ", style: TextStyle(fontSize: 18.0)),
              Text("${box.getToday()} cups", style: TextStyle(fontSize: 36.0)),
            ]),
            Column(children: [
              const Text("Coffees yesterday: ",
                  style: TextStyle(fontSize: 12.0)),
              Text("${getYesterday()} cups", style: TextStyle(fontSize: 12.0)),
            ]),
          ],
        ),
      ),
      floatingActionButton: ButtonBar(
        children: [
          FAB(
            increment,
            Row(
              children: const [Icon(Icons.coffee), Text("Add")],
            ),
          ),
          FAB(
            decrement,
            Row(
              children: const [
                Icon(Icons.accessibility_new),
                Text("Remove"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FAB extends StatelessWidget {
  const FAB(this.onPressed, this.child, {Key? key}) : super(key: key);
  final VoidCallback? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(theme.secondary),
        backgroundColor: MaterialStateProperty.all(theme.secondaryVariant),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
