import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

const _email = ['7wataaa@gmail.com'];

var _sendEmailUri = Mailto(to: _email);

class SendMailButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.mail_outlined),
      tooltip: '7wataaa@gmail.com',
      onPressed: () async {
        print(_sendEmailUri.toString());
        if (await canLaunch(_sendEmailUri.toString())) {
          await launch(_sendEmailUri.toString());
        } else {
          print('Can not launch');
        }
      },
    );
  }
}
