import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      body: LayoutGrid(
        //TODO レスポンシブ対応
        columnSizes: [
          /* 
          左: 830より小さければ0.px
              1090より小さければ100.px
              1090より大きければ1.fr
          中: 830より小さければ1.fr
              1090より小さければ1.fr
              1090より大きければ800px
          右: 左と同じ
           */
          (() {
            if (size.width <= 830) {
              return 0.px;
            } else if (size.width <= 1090) {
              return 100.px;
            } else {
              return 1.fr;
            }
          })(),
          (() {
            if (size.width < 830) {
              return 1.fr;
            } else if (size.width <= 1090) {
              return 1.fr;
            } else {
              return 900.px;
            }
          })(),
          (() {
            if (size.width <= 830) {
              return 0.px;
            } else if (size.width <= 1090) {
              return 100.px;
            } else {
              return 1.fr;
            }
          })(),
        ],
        rowSizes: [
          1.fr,
        ],
        areas: '''
          left centor right
        ''',
        children: [
          NamedAreaGridPlacement(
            areaName: 'left',
            child: const Text('left'),
          ),
          NamedAreaGridPlacement(
            areaName: 'centor',
            child: Container(
              color: Colors.white,
            ),
          ),
          NamedAreaGridPlacement(
            areaName: 'right',
            child: const Text('right'),
          ),
        ],
      ),
    );
  }
}
