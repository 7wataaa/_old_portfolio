import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/pages/body.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/widgets/responsive_grid.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProviderScope(child: Home()),
      theme: lightTheme,
      darkTheme: darkTheme,
      locale: const Locale('ja', 'JP'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
    );
  }
}

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Scrollbar(
          isAlwaysShown: true,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                //toolbarHeight: 40,
                expandedHeight: 120,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'portfolio',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              /* 諸悪の根源
              const Divider(
                thickness: 1,
              ), */
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: ResponsiveGrid(
                  width: size.width,
                  child: Body(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
