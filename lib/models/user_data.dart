class UserData {
  final String uid;
  final String sugars;
  final String name;
  final int strength;

  UserData({
    required this.uid,
    required this.sugars,
    required this.name,
    required this.strength,
  });

  factory UserData.fromUidAndMap(
    String uid,
    Map<String, dynamic> data,
  ) {
    return UserData(
      uid: uid,
      sugars: data['sugars'] ?? '0',
      name: data['name'] ?? '',
      strength: data['strength'] ?? 0,
    );
  }
}
