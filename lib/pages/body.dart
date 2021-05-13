import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/nanomemo_page.dart';
import 'package:portfolio/widgets/body_divider.dart';
import 'package:portfolio/widgets/github_redirect_button.dart';
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
                      width: 40,
                      child: const GithubRedirectButton(),
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
                  WorkCard(
                    modalBuilder: (context) {
                      final size = MediaQuery.of(context).size;

                      return NanomemoPage(size: size);
                    },
                    child: const Image(
                      image: AssetImage('assets/nanomemo.png'),
                    ),
                  ),
                  const WorkCard(
                    child: Image(
                      image: AssetImage('assets/extension.png'),
                    ),
                  ),
                  const WorkCard(
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
