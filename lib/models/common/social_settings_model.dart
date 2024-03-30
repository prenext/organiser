class SocialSettings {
  bool receiveNotifications;
  bool allowEmailNotifications;
  bool allowPushNotifications;
  bool allowMessageNotifications;

  SocialSettings({
    required this.receiveNotifications,
    required this.allowEmailNotifications,
    required this.allowPushNotifications,
    required this.allowMessageNotifications,
  });

  factory SocialSettings.fromJson(Map<String, dynamic> json) {
    return SocialSettings(
      receiveNotifications: json['receiveNotifications'] ?? true,
      allowEmailNotifications: json['allowEmailNotifications'] ?? true,
      allowPushNotifications: json['allowPushNotifications'] ?? true,
      allowMessageNotifications: json['allowMessageNotifications'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receiveNotifications': receiveNotifications,
      'allowEmailNotifications': allowEmailNotifications,
      'allowPushNotifications': allowPushNotifications,
      'allowMessageNotifications': allowMessageNotifications,
    };
  }
}
