import 'package:core/core.dart';

import '../model/profile.dart';
import '../model/profile_user_info.dart';

abstract class IProfileRepositoryOperations {
  Future<UpdatedUserName> changeUserName(String newName);
  Future<Profile?> getProfileData({bool forceReload});
}

abstract class IProfileRepository implements IProfileRepositoryOperations {
  Stream<Profile?> get profileStateChanges;
  Profile? get currentProfile;
  bool get isLoading;
}

class UpdatedUserName {
  UpdatedUserName({
    required this.previous,
    required this.newName,
  });

  final String? previous;
  final String? newName;
}

class ProfileRepository extends IProfileRepository {
  @override
  Stream<Profile?> get profileStateChanges => _state.stream;

  @override
  Profile? get currentProfile => _state.value;

  @override
  bool get isLoading => _state.isWaiting;

  final _state = InMemoryStore<Profile?>(
    Profile.fromJson({
      'userInfo': {'name': 'Luis Burgos'},
      'options': [
        {
          'id': 'accounts',
          'name': 'Accounts',
        },
        {
          'id': 'recurrent_transactions',
          'name': 'Recurrent Transactions',
        },
        {
          'id': 'tags',
          'name': 'Tags',
        },
      ],
    }),
  );

  @override
  Future<UpdatedUserName> changeUserName(String newName) {
    final currentName = currentProfile?.userInfo.name;
    final newUserInfo = ProfileUserInfo(name: newName);
    Profile? profileUpdated = currentProfile?.copyWith(
      userInfo: newUserInfo,
    );
    return Future.microtask(
      () => UpdatedUserName(
        previous: currentName,
        newName: profileUpdated?.userInfo.name,
      ),
    );
  }

  @override
  Future<Profile?> getProfileData({bool forceReload = false}) {
    return Future.microtask(() => currentProfile);
  }
}
