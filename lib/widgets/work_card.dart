import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WorkCard extends HookWidget {
  const WorkCard({
    required this.image,
    required this.fullscreenDialogPage,
  }) : super();

  final Widget image;

  final Widget fullscreenDialogPage;

  @override
  Widget build(BuildContext context) {
    final hoverPadding = useState(5 as double);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) => hoverPadding.value = 0,
      onExit: (_) => hoverPadding.value = 5,
      child: GestureDetector(
        onTap: () {
          Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => fullscreenDialogPage,
            ),
          );
        },
        child: SizedBox(
          width: 250,
          height: 250,
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.fromLTRB(
                hoverPadding.value, 0, hoverPadding.value, 0),
            child: image,
          ),
        ),
      ),
    );
  }
}
