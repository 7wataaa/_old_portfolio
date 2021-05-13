import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef ModalBuilder = Widget Function(BuildContext);

Widget defaultModalBuilder(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('未実装ページ'),
    ),
    body: const Center(
      child: Text('未実装'),
    ),
  );
}

class WorkCard extends HookWidget {
  const WorkCard({required this.child, this.modalBuilder = defaultModalBuilder})
      : super();

  final Widget child;

  final ModalBuilder modalBuilder;

  @override
  Widget build(BuildContext context) {
    final padState = useState(5 as double);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) => padState.value = 0,
      onExit: (_) => padState.value = 5,
      child: GestureDetector(
        onTap: () {
          Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: modalBuilder,
            ),
          );
        },
        child: SizedBox(
          width: 250,
          height: 250,
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.fromLTRB(padState.value, 0, padState.value, 0),
            child: child,
          ),
        ),
      ),
    );
  }
}
