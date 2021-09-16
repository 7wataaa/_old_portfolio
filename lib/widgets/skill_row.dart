import 'package:flutter/material.dart';

TableRow skillRow(
  BuildContext context,
  Widget logo,
  String title,
  String content,
) {
  return TableRow(
    children: [
      logo,
      Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: SelectableText(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      SelectableText(
        content,
        style: Theme.of(context).textTheme.bodyText2,
      )
    ],
  );
}
