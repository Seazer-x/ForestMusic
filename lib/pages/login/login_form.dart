import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/home/home_page.dart';
import 'package:forest_music_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/userlogin.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwdController = TextEditingController();
  bool _offstage = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwdController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse("https://baidu.com");
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 22, right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Login ForestMusic",
            style: TextStyle(
                color: primary.shade900,
                fontSize: 24,
                letterSpacing: 0,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 7),
          Text(
            "欢迎来到ForestMusic",
            style: TextStyle(
                color: primary.shade50,
                fontSize: 15,
                letterSpacing: 0,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 30),
          TextFormField(
              controller: usernameController,
              decoration:
                  const InputDecoration(labelText: '用户名', hintText: "请输入用户名")),
          const SizedBox(height: 10),
          TextFormField(
              controller: passwdController,
              decoration:
                  const InputDecoration(labelText: '密码', hintText: "请输入密码")),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              text: "忘记密码？",
              style: TextStyle(fontSize: 14, color: primary.shade100),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (!await launchUrl(url)) {
                    if (kDebugMode) {
                      print("Could not launch $url");
                    }
                  }
                },
            ),
          ),
          const SizedBox(height: 24),
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _offstage = false;
                  });
                  await login(usernameController.text, passwdController.text)
                      .then((value) => {
                            if (value.msg != "")
                              {}
                            else
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomePage(user: value)))
                              }
                          });
                },
                child: _offstage
                    ? const Text("登录")
                    : const CircularProgressIndicator.adaptive()),
          )
        ],
      ),
    );
  }
}
