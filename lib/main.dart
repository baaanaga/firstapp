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
  var price = TextEditingController();
  var amount = TextEditingController();
  var change = TextEditingController();
  double _total = 0;
  double _change = 0;

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: calculateButton(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: showTotalText(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: receiveMoneyTextField("get money"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: changeCalculateButton(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: showChangeText(),
          ),
        ],
      )
    );
  }

  Widget priceTextField(String text) {
    return TextField(
      controller: price,
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
      controller: amount,
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
        controller: change,
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
    return ElevatedButton(
      onPressed: () {
        if (price.text.isNotEmpty && amount.text.isNotEmpty) {
          setState(() {
            _total = double.parse(price.text) * double.parse(amount.text);
          });
        }
      },
      child: Text("Calculate Total")
    );
  }

  Widget showTotalText() {
    return Text("total : $_total Baht");
  }

  Widget changeCalculateButton() {
    return ElevatedButton(
      onPressed: () {
        if (change.text.isNotEmpty) {
          setState(() {
            _change = double.parse(change.text) - _total;
          });
        }
        if (double.parse(change.text) < _total) {
        ScaffoldMessenger.of(
          context,
          ).showSnackBar(SnackBar(content: Text("money is not enough")));
        }
      }, child: Text("Calculate Change"));
  }

  Widget showChangeText() {
    return Text("Change : $_change Baht");
  }
}
