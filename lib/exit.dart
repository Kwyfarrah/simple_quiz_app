import 'package:flutter/material.dart';

class Exit extends StatelessWidget {
  final VoidCallback replay;

 Exit(this.replay);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    child: Text('replay'),
    onPressed: replay,
    );
  }
}
