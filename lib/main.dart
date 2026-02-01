import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => CounterModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterScreen());
  }
}

List<Map<String, dynamic>> items = [
  {
    'item': 1,
    'isActive': false
  },
  {
    'item': 2,
    'isActive': true
  }
];

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite List')),
      body: Consumer<CounterModel>(
        builder: (context, counter, child) {
          return ListView.builder(
            itemCount: items.length, // Added itemCount
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Item #${items[index]['item']}'),
                    Icon(Icons.favorite_border),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () => increment(context),
              child: Icon(Icons.add)
          ),
          SizedBox(height: 10),
          FloatingActionButton(
              onPressed: () => reset(context),
              child: Icon(Icons.refresh)
          ),
        ],
      ),
    );
  }

  void increment(BuildContext context) { // Added type
    final counter = Provider.of<CounterModel>(context, listen: false);
    counter.increment();
  }

  void reset(BuildContext context) { // Added type
    final counter = Provider.of<CounterModel>(context, listen: false);
    counter.reset();
  }
}