import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/body_divider.dart';
import 'package:portfolio/pages/nanomemo_page.dart';
import 'package:url_launcher/url_launcher.dart';

const url = 'https://github.com/7wataaa';

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
                      width: 40,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async {
                            if (await canLaunch(url)) {
                              await launch(url);
                            }
                          },
                          child: const Image(
                            image: AssetImage('assets/GitHub-Mark-64px.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BodyDivider(),
            Container(
              child: Text(
                'SKILLS',
                style: GoogleFonts.quicksand(
                  textStyle: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SkillCard(
                    modalBuilder: (context) {
                      final size = MediaQuery.of(context).size;

                      return NanomemoPage(size: size);
                    },
                    child: const Image(
                      image: AssetImage('assets/nanomemo.png'),
                    ),
                  ),
                  const SkillCard(
                    child: Image(
                      image: AssetImage('assets/extension.png'),
                    ),
                  ),
                  const SkillCard(
                    child: Image(
                      image: AssetImage('assets/memoapp.png'),
                    ),
                  ),
                ],
              ),
            ),
            BodyDivider(),
          ],
        ),
      ),
    );
  }
}

typedef ModalBuilder = Widget Function(BuildContext);

Widget defaultModalBuilder(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('未実装ページ'),
    ),
    body: const Center(
      child: Text('未実装'),
    ),
  );
}

class SkillCard extends StatefulHookWidget {
  const SkillCard(
      {required this.child, this.modalBuilder = defaultModalBuilder})
      : super();

  final Widget child;

  final ModalBuilder modalBuilder;

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  @override
  Widget build(BuildContext context) {
    final padState = useState(5 as double);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) => padState.value = 0,
      onExit: (_) => padState.value = 5,
      child: GestureDetector(
        onTap: () {
          Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: widget.modalBuilder,
            ),
          );
        },
        child: SizedBox(
          width: 250,
          height: 250,
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.fromLTRB(padState.value, 0, padState.value, 0),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
