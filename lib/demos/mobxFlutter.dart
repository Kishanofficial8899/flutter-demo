import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/store.dart';

final counter = Counter();

class MobexCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter & Mobex Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(
            builder: (_) => Text(
              '${counter.intialCount}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Text('Counter', style: TextStyle(fontSize: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Add'),
                  color: Colors.green,
                  onPressed: () => counter.increment(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton.icon(
                  icon: Icon(Icons.remove),
                  label: Text('Minus'),
                  onPressed: () => counter.decrement(),
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
          FlatButton.icon(
            icon: Icon(Icons.reply),
            label: Text('Reset'),
            color: Colors.red,
            onPressed: () => counter.reset(),
          ),
        ],
      ),
    );
  }
}
