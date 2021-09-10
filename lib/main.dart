import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/pages/body.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/widgets/responsive_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final theme = watch(themeNotifierProvider);

        return MaterialApp(
          title: 'portfolio',
          debugShowCheckedModeBanner: false,
          theme: theme,
          locale: const Locale('ja', ''),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ja', ''),
          ],
          home: ProviderScope(child: Home()),
        );
      },
    );
  }
}

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLightMode =
        useProvider(themeNotifierProvider).brightness == Brightness.light;

    return Scaffold(
      body: Container(
        child: Scrollbar(
          isAlwaysShown: true,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: size.width / 40),
                    child: IconButton(
                      onPressed: context
                          .read(themeNotifierProvider.notifier)
                          .toggleTheme,
                      icon: Icon(
                        isLightMode
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode_outlined,
                      ),
                    ),
                  ),
                ],
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
