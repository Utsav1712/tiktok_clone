class PostModel {
  final int pid;
  final String type;
  final String url;
  final String description;

  PostModel({
    required this.pid,
    required this.type,
    required this.url,
    required this.description,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final cmpData = json['cmp'][0]['data'];
    return PostModel(
      pid: json['pid'],
      type: cmpData['format'] == 3
          ? 'video'
          : cmpData['format'] == 1
          ? 'image'
          : 'text',
      url: cmpData['url']??"",
      description: json['tp']['description'] ?? '',
    );
  }
}
