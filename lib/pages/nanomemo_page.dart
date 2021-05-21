import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/custom_carousel.dart';
import 'package:portfolio/widgets/responsive_grid.dart';

const descriptionStr = '''
タグでメモを整理できるメモアプリ

Googleアカウントもしくはメールアドレスでアカウントを作成することで、
ユーザーごとにメモを保存できるようにしました。

保存されるデータは、スマホアプリのmemoapp(仮称)と同期が可能になっています。''';

class NanomemoPage extends HookWidget {
  const NanomemoPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    const _items = [
      Image(
        image: AssetImage('assets/nanomemo.png'),
      ),
      Image(
        image: AssetImage('assets/memoapp.png'),
      ),
    ];

    final mobilepadding = size.width <= 480 ? 15.0 : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'nanomemo',
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
                            ? const MobileCustomCarousel(items: _items)
                            : CustomCarousel(
                                items: _items,
                              ),
                        Container(
                          width: 500,
                          padding: EdgeInsets.only(
                              left: mobilepadding, right: mobilepadding),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  '説明',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                              Text(
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
