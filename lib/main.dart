import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GL',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'GL Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: priceTextField("price per item"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: amountTextField("amount of items"),
          ),
          calculateButton(),
          showTotalText(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: receiveMoneyTextField("get money"),
          ),
          Text("Hello World 4")
        ],
      )
    );
  }

  Widget priceTextField(String text) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: text,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }

  Widget amountTextField(String text) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: text,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }

  Widget receiveMoneyTextField(String text) {
      return TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: text,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
      );
    }
  Widget calculateButton() {
    return ElevatedButton(onPressed: () {}, child: Text("Calculate Total"));
  }

  Widget showTotalText() {
    return Text("total : Bath");
  }
}
