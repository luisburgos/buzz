import 'package:flutter/material.dart';

import '../profile.dart';

class ProfileViewTemplate extends StatelessWidget {
  const ProfileViewTemplate({
    Key? key,
    required this.userName,
    required this.items,
    required this.onItemTap,
  }) : super(key: key);

  final String userName;
  final List<ProfileOption> items;
  final Function(String) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProfileHeader(userName: userName),
        _ProfileOptionsList(
          items: items,
          onItemTap: onItemTap,
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        userName,
      ),
    );
  }
}

class _ProfileOptionsList extends StatelessWidget {
  const _ProfileOptionsList({
    Key? key,
    required this.items,
    required this.onItemTap,
  }) : super(key: key);

  final List<ProfileOption> items;
  final Function(String) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return _ProfileOptionListTile(
          name: item.name,
          onTap: () {
            onItemTap(item.id);
          },
        );
      },
    );
  }
}

class _ProfileOptionListTile extends StatelessWidget {
  const _ProfileOptionListTile({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(name),
      ),
      onTap: onTap,
    );
  }
}
