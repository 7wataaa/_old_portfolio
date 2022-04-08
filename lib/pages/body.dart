import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/work_description_page_dialog.dart';
import 'package:portfolio/widgets/body_divider.dart';
import 'package:portfolio/widgets/github_redirect_button.dart';
import 'package:portfolio/widgets/send_mail_button.dart';
import 'package:portfolio/widgets/skill_row.dart';
import 'package:portfolio/widgets/video_player_widget.dart';
import 'package:portfolio/widgets/work_card.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Row(
                      //spacing: 20,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const GithubRedirectButton(),
                        const SizedBox(
                          width: 15,
                        ),
                        SendMailButton(),
                      ].map(
                        (e) {
                          return e is SizedBox
                              ? e
                              : SizedBox(
                                  width: 35,
                                  child: e,
                                );
                        },
                      ).toList(),
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
                  image: const Image(
                    image: AssetImage('assets/nanomemo.png'),
                    semanticLabel: 'nanomemo',
                  ),
                  fullscreenDialogPage: WorkDescriptionPageDialog(
                    title: 'nanomemo',
                    images: const [
                      VideoPlayerWidget(
                          dataSource: 'assets/nanomemo-overview.mp4'),
                      VideoPlayerWidget(
                          dataSource: 'assets/nanomemo-mail-auth.mp4'),
                      Image(
                        image: AssetImage('assets/nanomemo.png'),
                      ),
                    ],
                    descriptions: [
                      SelectableText(
                        '''
タグでメモを整理できるメモアプリ

Firebase Authenticationを利用してユーザー認証を､
Firebase Cloud Firestoreを利用してデータ管理を行っています｡

保存されるデータは、スマホアプリのmemoapp(仮称)と同期が可能になっています。

フロントは前々から興味があったReactを使用しました｡スマホアプリとの統一感をもたせるため､MaterialUIを採用しています｡

制作期間: 約三ヶ月
言語: typescript
使用したもの: React(hooks, MaterialUI, StyledComponents), Firebase(Authentication, Cloud Firestore) など''',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                WorkCard(
                  image: const Image(
                    image: AssetImage(
                        'assets/abc_notification_bot_helpcommand.png'),
                    semanticLabel: 'abc-notification-bot',
                  ),
                  fullscreenDialogPage: WorkDescriptionPageDialog(
                    title: 'abc-notification-bot',
                    images: const [
                      Image(
                        image: AssetImage(
                            'assets/abc_notification_bot_helpcommand.png'),
                        semanticLabel: 'abc-notification-bot',
                      ),
                    ],
                    descriptions: [
                      SelectableText(
                        '''
AtCoder Beginner Contestの開催時間を通知するDiscordボット

隔週週末の夜に開催されているAtCoder Beginner Contestの通知ボットがあったら便利だと思ったので制作しました｡
開催時刻から一日前･三十分前と､開催時刻にDiscordにて通知します｡

動作の流れは､
GASで予定されたコンテスト情報を定期的に取得し､
サーバーにてGASからデータを取得し､開催時刻になったら通知
といった流れになっています｡

(GASを挟む理由としては､スクレイピングの定期実行を行うときの信頼性を考慮しました)

制作期間: 約一ヶ月
言語: typescript
使用したもの: GAS, Heroku, Docker, ts-node, prisma, Discord.js など''',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                WorkCard(
                  image: const Image(
                    image: AssetImage('assets/extension.png'),
                    semanticLabel: 'nnt',
                  ),
                  fullscreenDialogPage: WorkDescriptionPageDialog(
                    title: 'nnt',
                    images: const [
                      VideoPlayerWidget(
                        dataSource: 'assets/nnt-overview.mp4',
                      ),
                      Image(
                        image: AssetImage('assets/extension.png'),
                        semanticLabel: 'nnt',
                      ),
                    ],
                    descriptions: [
                      SelectableText(
                        '''
新しいタブに時計とメモを追加するChrome拡張機能です。

Chrome標準の新しいタブを開いたときの画面が使いにくいと思ったので制作しました。

メモ内容はchrome.storage APIによってアカウント間での同期ができます｡

制作期間: 半月～一ヶ月
言語: HTML, CSS, JavaScript
使ったもの(?): Chrome拡張機能, Chromeウェブストア など''',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                WorkCard(
                  image: const Image(
                    image: AssetImage('assets/memoapp.png'),
                    semanticLabel: 'memoapp',
                  ),
                  fullscreenDialogPage: WorkDescriptionPageDialog(
                    title: 'memoapp',
                    images: const [
                      Image(
                        image: AssetImage('assets/memoapp.png'),
                        semanticLabel: 'memoapp',
                      ),
                    ],
                    descriptions: [
                      SelectableText(
                        '''
アプリ制作の練習のために制作したスマートフォン向けメモアプリです｡

Firebase Authenticationを利用してユーザー認証を行いました｡
データはローカルにも保存できますが､Firebase Cloud Firestoreで同期させることもできるようにしました｡

このアプリの制作で､非同期処理､クラス､git等が最低限扱えるようになったと思います｡

制作期間: 約四ヶ月
言語: Dart
使ったもの: Flutter(riverpod), Firebase(Authentication, Cloud Firestore) など''',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BodyDivider(),
          Container(
            margin: const EdgeInsets.only(top: 9, bottom: 14),
            child: Text(
              'SKILLS',
              style: GoogleFonts.quicksand(
                textStyle: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.top,
              columnWidths: const {
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(0.4)
              },
              children: [
                skillRow(
                  context,
                  const FlutterLogo(
                    size: 32,
                  ),
                  'Flutter (Dart)',
                  'freezed & stateNotifier & riverpodを使った状態管理で基本的なアプリを作成できる',
                ),
                skillRow(
                  context,
                  const Image(
                    width: 32,
                    height: 32,
                    image: AssetImage(
                      'assets/firebase-logomark.png',
                    ),
                  ),
                  'Firebase',
                  'Cloud FirestoreとAuthenticationを使用して基本的なアプリを作成できる',
                ),
                skillRow(
                  context,
                  SvgPicture.asset(
                    'assets/ts-logo-128.svg',
                    width: 32,
                  ),
                  'TypeScript',
                  '''
バックエンド(Express)､ フロントエンド(React)､ GAS(clasp)で制作経験あり｡ Dartに次いで好き''',
                ),
                skillRow(
                  context,
                  SvgPicture.asset(
                    'assets/React-icon.svg',
                    width: 60,
                  ),
                  'React',
                  'Material-UI & styled-componentsを使用してアプリを制作したことがある',
                ),
                skillRow(
                  context,
                  const Image(
                    width: 33,
                    height: 33,
                    image: AssetImage(
                      'assets/cpp_logo.png',
                    ),
                  ),
                  'C++',
                  '''競技プログラミング(AtCoderID: nashi13)やArduinoで使用している｡ 好きなアルゴリズムは幅優先探索''',
                )
              ],
            ),
          ),
          BodyDivider(),
          Container(
            height: 10,
            color: Theme.of(context).scaffoldBackgroundColor,
          )
        ],
      ),
    );
  }
}
