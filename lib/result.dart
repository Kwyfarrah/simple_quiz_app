import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int counter;

  Result(this.counter);

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Text('You did it', style: Theme.of(context).textTheme.headline5),
         Text('Current Score: $counter',
              style: Theme.of(context).textTheme.headline6
          ),
        ]
    );
  }
}
