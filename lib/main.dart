import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/pages/body.dart';
import 'package:portfolio/theme.dart';

void main() {
  runApp(ProviderScope(
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('portfolio'),
        toolbarHeight: 40,
      ),
      body: Container(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: ResponsiveGrid(
              width: size.width,
              child: Body(),
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class ResponsiveGrid extends HookWidget {
  const ResponsiveGrid({this.width, this.child});

  final double width;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (width <= 1090) {
      final paddingValue = (() {
        if (width <= 840) {
          return 0.0;
        } else if (width <= 1090) {
          return 100.0;
        }
      })();

      return Padding(
        padding: EdgeInsets.fromLTRB(
          paddingValue,
          0,
          paddingValue,
          0,
        ),
        child: child,
      );
    }

    //width > 1090の場合
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 900,
          child: child,
        ),
        Expanded(
          child: Container(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
