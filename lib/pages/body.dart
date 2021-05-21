import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/memoapp.dart';
import 'package:portfolio/pages/nanomemo_page.dart';
import 'package:portfolio/pages/nnt_page.dart';
import 'package:portfolio/widgets/body_divider.dart';
import 'package:portfolio/widgets/github_redirect_button.dart';
import 'package:portfolio/widgets/send_mail_button.dart';
import 'package:portfolio/widgets/work_card.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'NAWATA NAOKI',
                      style: GoogleFonts.quicksand(
                        fontSize: 43,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, 1),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Wrap(
                        spacing: 20,
                        children:  [
                          const  GithubRedirectButton(),
                          SendMailButton(),
                        ]
                            .map(
                              (e) => SizedBox(
                                width: 35,
                                child: e,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BodyDivider(),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 25),
              child: Text(
                'WORKS',
                style: GoogleFonts.quicksand(
                  textStyle: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  WorkCard(
                    modalBuilder: (context) {
                      final size = MediaQuery.of(context).size;

                      return NanomemoPage(size: size);
                    },
                    child: const Image(
                      image: AssetImage('assets/nanomemo.png'),
                      semanticLabel: 'nanomemo',
                    ),
                  ),
                  WorkCard(
                    modalBuilder: (context) {
                      final size = MediaQuery.of(context).size;

                      return NNTPage(size: size);
                    },
                    child: const Image(
                      image: AssetImage('assets/extension.png'),
                      semanticLabel: 'nnt',
                    ),
                  ),
                  WorkCard(
                    modalBuilder: (context) {
                      final size = MediaQuery.of(context).size;

                      return MemoappPage(size: size);
                    },
                    child: const Image(
                      image: AssetImage('assets/memoapp.png'),
                      semanticLabel: 'memoapp',
                    ),
                  ),
                ],
              ),
            ),
            BodyDivider(),
            Container(
              margin: const EdgeInsets.only(top: 9, bottom: 10),
              child: Text(
                'SKILLS',
                style: GoogleFonts.quicksand(
                  textStyle: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: SelectableText.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: '・Flutter\n',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 23,
                          ),
                    ),
                    const TextSpan(
                        text:
                            '''ライブラリ: riverpods、Flutter Hooks、FlutterFireなど\n雑感: Dartも含めてとても好きで、一番長く触っているものになります。\n'''),
                    TextSpan(
                      text: '・React （TypeScript）\n',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 23, height: 3),
                    ),
                    const TextSpan(
                        text:
                            '''ライブラリ・機能 : hooks、Material-UI、styled-componentsなど\n雑感: hooks使ってみたさで触り始めました。使い勝手がシンプルでかつ強力な点が好きです。\n'''),
                    TextSpan(
                      text: '・C++\n',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 23, height: 3),
                    ),
                    const TextSpan(
                        text: '''雑感: 競技プログラミング(AtCoder)で使用しています。強くなりたい。\n'''),
                    TextSpan(
                      text: '・その他最低限使用できるツール\n',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 23, height: 3),
                    ),
                    const TextSpan(
                        text: '''ツール: adobe XD・Illustrator・Photoshop'''),
                  ],
                ),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
            BodyDivider(),
          ],
        ),
      ),
    );
  }
}
