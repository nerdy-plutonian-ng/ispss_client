import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  final String _message;

  Loader(this._message);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Lottie.asset(
                  'assets/animations/loaderone.json',
                  height: 200,
                  width: 200,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(_message,style: Theme.of(context).textTheme.headline6),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
