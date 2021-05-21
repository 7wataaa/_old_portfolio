import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/custom_carousel.dart';
import 'package:portfolio/widgets/responsive_grid.dart';

const descriptionStr = '''
Flutterで制作したメモアプリです。

Flutterの練習も兼ねて制作しました。

ユーザー認証・内容の同期には、Firebaseを使用しています。
''';

class MemoappPage extends HookWidget {
  const MemoappPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    const _list = [
      Image(
        image: AssetImage('assets/memoapp.png'),
      ),
      Image(
        image: AssetImage('assets/extension.png'),
      ),
    ];

    final mobilepadding = size.width <= 480 ? 15.0 : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'memoapp',
          style: GoogleFonts.quicksand(),
        ),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ResponsiveGrid(
                width: size.width,
                child: Container(
                  color: Theme.of(context).backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        size.width <= 480
                            ? const MobileCustomCarousel(items: _list)
                            : CustomCarousel(items: _list),
                        Container(
                          padding: EdgeInsets.only(
                              left: mobilepadding, right: mobilepadding),
                          width: 500,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: SelectableText(
                                  '説明',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                              SelectableText(
                                descriptionStr,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
