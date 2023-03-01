class Brew {
  final String sugars;
  final String name;
  final int strength;

  Brew({
    required this.sugars,
    required this.name,
    required this.strength,
  });

  factory Brew.fromMap(Map<String, dynamic> data) {
    return Brew(
      sugars: data['sugars'] ?? '0',
      name: data['name'] ?? '',
      strength: data['strength'] ?? 0,
    );
  }
}
