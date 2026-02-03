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

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite List')),
      body: Consumer<CounterModel>(
        builder: (context, counter, child) {
          return ListView.builder(
            itemCount: counter.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = counter.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Item #${item['item']}'),
                    // just wrap icon with GestureDetector and toggle
                    GestureDetector(
                      onTap: () => counter.toggleFavorite(index),
                      child: Icon(
                        item['isActive'] ? Icons.favorite : Icons.favorite_border,
                        color: item['isActive'] ? Colors.red : null,
                      ),
                    ),
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
              onPressed: () => increment(context), child: Icon(Icons.add)),
          SizedBox(height: 10),
          FloatingActionButton(
              onPressed: () => reset(context), child: Icon(Icons.refresh)),
        ],
      ),
    );
  }

  void increment(BuildContext context) {
    Provider.of<CounterModel>(context, listen: false).increment();
  }

  void reset(BuildContext context) {
    Provider.of<CounterModel>(context, listen: false).reset();
  }
}