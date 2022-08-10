import 'package:flutter/material.dart';
import 'package:love_sing_app/theme.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
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
            decoration:
                const InputDecoration(labelText: '用户名', hintText: "请输入用户名"),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '密码',
              hintText: "请输入密码",
            ),
          ),
          Text(
            "忘记密码？",
            style: TextStyle(fontSize: 14, color: primary.shade100),
          ),
          const SizedBox(height: 24),
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(onPressed: () {}, child: const Text("登录")),
          ),
          const SizedBox(height: 124),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "没有账号？",
                style: TextStyle(
                    color: primary.shade50,
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "立即注册",
                style: TextStyle(
                    color: primary.shade200,
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
