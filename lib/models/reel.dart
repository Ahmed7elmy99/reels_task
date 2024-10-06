class Reel {
  final int id;
  final String videoUrl;
  final String previewUrl;
  final String duration;
  final int likes;

  Reel({
    required this.id,
    required this.videoUrl,
    required this.previewUrl,
    required this.duration,
    required this.likes,
  });

  factory Reel.fromJson(Map<String, dynamic> json) {
    return Reel(
      id: json['id'],
      videoUrl: json['video'],
      previewUrl: json['preview'],
      duration: json['duration'],
      likes: json['likes_count'],
    );
  }
}
