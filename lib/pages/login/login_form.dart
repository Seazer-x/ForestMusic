import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forest_music_app/pages/home/home_page.dart';
import 'package:forest_music_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/userlogin.dart';

class LoginForm extends StatefulWidget {
  final AudioPlayer player;
  const LoginForm({Key? key, required this.player}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwdController = TextEditingController();
  bool _offstage = true;
  bool pwdShow = false;
  late FToast fToast;
  late String id;

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
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String msg, String type) {
    Map selectType(String type) {
      Map colorAndtype = {};
      switch (type) {
        case "error":
          colorAndtype.putIfAbsent("color", () => Colors.red.shade200);
          colorAndtype.putIfAbsent("icon", () => FontAwesomeIcons.xmark);
          break;
        case "success":
          colorAndtype.putIfAbsent("color", () => primary.shade100);
          colorAndtype.putIfAbsent("icon", () => FontAwesomeIcons.check);
          break;
        case "info":
          colorAndtype.putIfAbsent("color", () => Colors.blue.shade200);
          colorAndtype.putIfAbsent("icon", () => FontAwesomeIcons.info);
          break;
      }
      return colorAndtype;
    }

    final colorAndtype = selectType(type);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: colorAndtype["color"],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(colorAndtype["icon"]),
          const SizedBox(
            width: 12.0,
          ),
          Text(msg),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse("https://baidu.com");
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        padding: const EdgeInsets.only(left: 30, top: 22, right: 35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Text("欢迎来到ForestMusic",
              style: TextStyle(
                  color: primary.shade900,
                  fontSize: 24,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 7),
          Text("Login Forest Music",
              style: TextStyle(
                  color: primary.shade50,
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 30),
          TextFormField(
              style: const TextStyle(color: Colors.black87),
              controller: usernameController,
              decoration: const InputDecoration(
                  labelStyle: TextStyle(color: primary),
                  hintStyle: TextStyle(color: secondaryTextColor),
                  labelText: '用户名',
                  hintText: "请输入用户名")),
          const SizedBox(height: 10),
          TextFormField(
            style: const TextStyle(color: Colors.black87),
            controller: passwdController,
            decoration: InputDecoration(
                labelStyle: const TextStyle(color: primary),
                hintStyle: const TextStyle(color: secondaryTextColor),
                suffixIcon: IconButton(
                    icon:
                        Icon(pwdShow ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        pwdShow = !pwdShow;
                      });
                    }),
                labelText: '密码',
                hintText: "请输入密码"),
            obscureText: !pwdShow,
          ),
          const SizedBox(height: 10),
          Text.rich(TextSpan(
              text: "忘记密码？",
              style: TextStyle(fontSize: 14, color: primary.shade100),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(url);
                })),
          const SizedBox(height: 24),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width - 65, 40))),
                onPressed: _offstage
                    ? () async {
                        if (usernameController.text == "") {
                          _showToast("请输入用户名", "info");
                          return;
                        } else if (passwdController.text == "") {
                          _showToast("请输入密码", "info");
                          return;
                        }
                        setState(() {
                          _offstage = false;
                        });
                        await login(
                                usernameController.text, passwdController.text)
                            .then((value) => {
                                  if (value.msg != "")
                                    {
                                      _showToast(value.msg, "error"),
                                      setState(() {
                                        _offstage = true;
                                      })
                                    }
                                  else if (value.locked == 1)
                                    {
                                      _showToast(
                                          "账户已被锁，请联系管理员\nfubaiping@gmail.com",
                                          "error"),
                                      setState(() {
                                        _offstage = true;
                                      })
                                    }
                                  else
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(player: widget.player),
                                            settings: RouteSettings(
                                              arguments: value,
                                            ))),
                                  setState(() {
                                    _offstage = true;
                                  })
                                });
                      }
                    : null,
                child: _offstage
                    ? const Text("登录")
                    : const CircularProgressIndicator.adaptive(strokeWidth: 5)),
          ]),
        ]),
      ),
    );
  }
}
