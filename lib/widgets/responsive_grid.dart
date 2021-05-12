import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@immutable
class ResponsiveGrid extends HookWidget {
  const ResponsiveGrid({required this.width, required this.child});

  final double width;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (width <= 1090) {
      final paddingValue = (() {
        if (width <= 840) {
          return 0.0;
        } else {
          //if (width <= 1090)
          return 100.0;
        }
      })();

      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            paddingValue,
            0,
            paddingValue,
            0,
          ),
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: child,
          ),
        ),
      );
    }

    //width > 1090の場合
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              //color: Colors.white,
              ),
        ),
        SizedBox(
          width: 900,
          child: child,
        ),
        Expanded(
          child: Container(
              //color: Colors.white,
              ),
        ),
      ],
    );
  }
}
