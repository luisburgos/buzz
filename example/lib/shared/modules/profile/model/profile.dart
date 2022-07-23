import 'profile_option.dart';
import 'profile_user_info.dart';

class Profile {
  Profile({
    required this.userInfo,
    required this.options,
  });

  Profile.empty()
      : userInfo = ProfileUserInfo.empty(),
        options = [];

  final ProfileUserInfo userInfo;
  final List<ProfileOption> options;

  Profile.fromJson(Map<String, dynamic> json)
      : userInfo = ProfileUserInfo.fromJson(json['userInfo']),
        options = List.from(json['options'])
            .map((e) => ProfileOption.fromJson(e))
            .toList();

  Map toJson() => {
        'userInfo': userInfo.toJson(),
        'options': options,
      };

  Profile copyWith({
    ProfileUserInfo? userInfo,
    List<ProfileOption>? options,
  }) =>
      Profile(
        userInfo: userInfo ?? this.userInfo,
        options: options ?? this.options,
      );
}
