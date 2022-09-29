class User {
  final String id;
  final String nickname;
  final String avatar;
  final int locked;
  final String msg;
  const User(
      {required this.id,
      required this.nickname,
      required this.avatar,
      required this.msg,
      required this.locked});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        nickname: json['nickname'],
        avatar: json['avatar'],
        msg: json['msg'] ?? "",
        locked: json['locked']);
  }
  factory User.error(Map<String, dynamic> json) {
    return User(
      id: json['code'] ?? "",
      nickname: json['nickname'] ?? "",
      avatar: json['avatar'] ?? "",
      msg: json['msg'] ?? "",
      locked: json['locked'] ?? "",
    );
  }
}
