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
      id: json['id'] ?? "",
      nickname: json['nickname'] ?? "",
      avatar: json['avatar'] ?? "",
      msg: json['msg'] ?? "",
      locked: json['locked'] ?? 0,
    );
  }

  /// 实体类转 Map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nickname'] = nickname;
    data['avatar'] = avatar;
    data['locked'] = locked;
    return data;
  }
}
