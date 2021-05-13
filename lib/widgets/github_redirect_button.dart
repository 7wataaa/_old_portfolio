import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/rendering.dart';

const url = 'https://github.com/7wataaa';

class GithubRedirectButton extends StatelessWidget {
  const GithubRedirectButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
    );
  }
}
