class WandEntity {
  final String wood;
  final String core;
  final double length;

  WandEntity({
    required this.wood,
    required this.core,
    required this.length,
  });

  Map<String, dynamic> toJson() => {
        "wood": wood,
        "core": core,
        "length": length,
      };
}
