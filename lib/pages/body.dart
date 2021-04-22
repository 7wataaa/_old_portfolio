import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        children: const [
          SelectableText(
            '''
ぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょうぶんしょう
''',
            style: TextStyle(fontSize: 50),
          )
        ],
      ),
    );
  }
}
