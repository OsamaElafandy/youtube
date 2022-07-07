class NotificationModel {
  final String name;
  final String messageType;
  final String message;
  final String timeStamp;
  final String avatarUrl;

  NotificationModel(
      {this.name,
      this.messageType,
      this.message,
      this.timeStamp,
      this.avatarUrl});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'messageType': messageType,
      'message': message,
      'timeStamp': timeStamp,
      'avatarUrl': avatarUrl,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> map) {
    return NotificationModel(
      name: map['name'] ?? '',
      messageType: map['messageType'] ?? '',
      message: map['message'] ?? '',
      timeStamp: map['timeStamp'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
    );
  }
}
