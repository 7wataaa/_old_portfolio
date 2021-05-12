import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BodyDivider extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      child: Divider(
        thickness: 1.5,
        indent: 50,
        endIndent: 50,
      ),
    );
  }
}
