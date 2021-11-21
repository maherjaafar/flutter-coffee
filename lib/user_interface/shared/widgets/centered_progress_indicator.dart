import 'package:flutter/material.dart';

class CenteredProgressIndicator extends StatelessWidget {
  const CenteredProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
