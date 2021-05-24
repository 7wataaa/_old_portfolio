import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/rendering.dart';

const _url = 'https://github.com/7wataaa';

class GithubRedirectButton extends StatelessWidget {
  const GithubRedirectButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: GestureDetector(
          onTap: () async {
            if (await canLaunch(_url)) {
              await launch(_url);
            }
          },
          child: const Tooltip(
            message: _url,
            child: Image(
              image: AssetImage('assets/GitHub-Mark-64px.png'),
            ),
          ),
        ),
      ),
    );
  }
}
