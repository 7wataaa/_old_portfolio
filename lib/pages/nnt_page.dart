import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/custom_carousel.dart';
import 'package:portfolio/widgets/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

const _descriptionStr = '''
新しいタブに時計とメモを追加するChrome拡張機能です。

Chrome標準の新しいタブを開いたときの画面が使いにくいと思ったので制作しました。

メモ内容は同一アカウント間で同期させることができます。

Chromeウェブストアリンク↓
''';

const _nntUrl =
    'https://chrome.google.com/webstore/detail/nnt/ghnofmbjklnpefpbjagooadfmoooknaj?hl=ja';

class NNTPage extends HookWidget {
  const NNTPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'nnt',
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
                        CustomCarousel(
                          items: const [
                            Image(
                              image: AssetImage('assets/extension.png'),
                            ),
                            Image(
                              image: AssetImage('assets/memoapp.png'),
                            ),
                          ],
                        ),
                        Container(
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
                              SelectableText.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: _descriptionStr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    TextSpan(
                                      text: _nntUrl,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          if (await canLaunch(_nntUrl)) {
                                            await launch(_nntUrl);
                                          }
                                        },
                                    ),
                                  ],
                                ),
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
