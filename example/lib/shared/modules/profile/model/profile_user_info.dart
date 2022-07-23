class ProfileUserInfo {
  final String name;

  ProfileUserInfo({
    required this.name,
  });

  ProfileUserInfo.empty() : name = "";

  ProfileUserInfo.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map toJson() => {
        'name': name,
      };
}
