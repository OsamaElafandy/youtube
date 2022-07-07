class YoutubeModel {
  final String title;
  final String description;
  final String thumbNail;
  final String publishedTime;
  final String channelTitle;
  final String channelAvatar;
  final String viewCount;
  final String likeCount;
  final String dislikeCount;
  final String videoUrl;
  final String subscriptionCount;

  YoutubeModel(
      {this.title,
      this.description,
      this.thumbNail,
      this.subscriptionCount,
      this.publishedTime,
      this.channelTitle,
      this.channelAvatar,
      this.viewCount,
      this.likeCount,
      this.videoUrl,
      this.dislikeCount});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subscriptionCount': subscriptionCount,
      'description': description,
      'thumbNail': thumbNail,
      'publishedTime': publishedTime,
      'channelTitle': channelTitle,
      'channelAvatar': channelAvatar,
      'viewCount': viewCount,
      'likeCount': likeCount,
      'dislikeCount': dislikeCount,
      'videoUrl': videoUrl,
    };
  }

  factory YoutubeModel.fromJson(Map<String, dynamic> map) {
    return YoutubeModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      thumbNail: map['thumbNail'] ?? '',
      publishedTime: map['publishedTime'] ?? '',
      channelTitle: map['channelTitle'] ?? '',
      channelAvatar: map['channelAvatar'] ?? '',
      viewCount: map['viewCount'] ?? '',
      likeCount: map['likeCount'] ?? '',
      dislikeCount: map['dislikeCount'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      subscriptionCount: map['subscriptionCount'] ?? '',
    );
  }
}
