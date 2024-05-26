class MediaType {
  final String url;
  final String type; // This can be a file extension or MIME type

  MediaType({
    required this.url,
    required this.type,
  });

  factory MediaType.fromJson(Map<String, dynamic> json) {
    return MediaType(
      url: json['url'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'type': type,
    };
  }
}
