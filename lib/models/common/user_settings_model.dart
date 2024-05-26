class UserSettings {
  bool darkMode;
  int defaultPriority;
  bool notificationsEnabled;

  UserSettings({
    required this.darkMode,
    required this.defaultPriority,
    required this.notificationsEnabled,
  });

  // Factory constructor to create a UserSettings instance from a map
  factory UserSettings.fromMap(Map<String, dynamic> map) {
    return UserSettings(
      darkMode: map['darkMode'] ?? false,
      defaultPriority: map['defaultPriority'] ?? 0,
      notificationsEnabled: map['notificationsEnabled'] ?? true,
    );
  }

  // Method to convert UserSettings instance to a map
  Map<String, dynamic> toMap() {
    return {
      'darkMode': darkMode,
      'defaultPriority': defaultPriority,
      'notificationsEnabled': notificationsEnabled,
    };
  }
}
