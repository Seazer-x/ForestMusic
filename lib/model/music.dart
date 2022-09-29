class Music {
  final String id;
  final String name;
  final String url;
  final String singer;
  final String cover;
  final String lyricUrl;
  const Music({
    required this.id,
    required this.name,
    required this.url,
    required this.cover,
    required this.lyricUrl,
    required this.singer,
  });
  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
        id: json['id'],
        name: json['name'],
        url: json['url'],
        cover: json['cover'],
        lyricUrl: json['lyricUrl'],
        singer: json['singer']['name']);
  }
}
