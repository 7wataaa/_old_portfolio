import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final indexState = useState(0);

    print(indexState.value);

    return Scaffold(
      appBar: AppBar(
        title: const Text('タイトル'),
        toolbarHeight: 50,
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: indexState.value,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.smartphone_outlined),
                  selectedIcon: Icon(Icons.smartphone),
                  label: Text('smart phone app')),
              NavigationRailDestination(
                icon: Icon(Icons.computer_outlined),
                selectedIcon: Icon(Icons.computer),
                label: Text('pc app'),
              ),
            ],
            onDestinationSelected: (i) => indexState.value = i,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Container(
              color: [Colors.blue, Colors.red][indexState.value],
            ),
          ),
        ],
      ),
    );
  }
}
