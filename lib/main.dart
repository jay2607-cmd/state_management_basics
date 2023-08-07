import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// basic demo to understand the concept of Provider
// need to update

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: MaterialApp(
        title: 'State Management',
        home: Scaffold(
          appBar: AppBar(
            title: TextLevel1(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return Level2();
  }
}

class Level2 extends StatelessWidget {
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return Level3();
  }
}

class Level3 extends StatelessWidget {
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldLevel3(),
        Text(Provider.of<MyProvider>(context).data,),
      ],
    );
  }
}

class TextLevel1 extends StatelessWidget {
  const TextLevel1({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<MyProvider>(context).data,);
  }
}

class TextFieldLevel3 extends StatelessWidget {
  const TextFieldLevel3({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newValue) {
        Provider.of<MyProvider>(context, listen: false).changeData(newValue);
      },
    );
  }
}

class MyProvider extends ChangeNotifier {
  String data = "State Management";

  void changeData(String newValue) {
    data = newValue;
    notifyListeners();
  }
}
