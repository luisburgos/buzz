class ProfileOption {
  ProfileOption({
    required this.name,
    required this.id,
  });

  final String id;
  final String name;

  ProfileOption.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map toJson() => {
        'id': id,
        'name': name,
      };
}
