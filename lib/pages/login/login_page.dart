import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/login/login_form.dart';

import '../../theme.dart';

class LoginPage extends StatefulWidget {
  final AudioPlayer player;
  const LoginPage({Key? key, required this.player}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: lightColorScheme.primary,
        padding: const EdgeInsets.only(top: 200),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            children: <Widget>[
              TabBar(
                  indicatorColor: primary,
                  controller: _tabController,
                  labelColor: lightColorScheme.primary,
                  unselectedLabelColor: lightColorScheme.outline,
                  tabs: const <Widget>[Tab(text: "登录"), Tab(text: "注册")]),
              Expanded(
                  child:
                      TabBarView(controller: _tabController, children: <Widget>[
                SingleChildScrollView(child: LoginForm(player: widget.player)),
                const SingleChildScrollView(child: Center(child: Text("登录")))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
