import 'package:flutter_clean_api/features/user_list/domain/entities/wand_entity.dart';

class WandModel extends WandEntity {
  WandModel({required super.wood, required super.core, required super.length});

  WandModel copyWith({
    String? wood,
    String? core,
    double? length,
  }) =>
      WandModel(
        wood: wood ?? this.wood,
        core: core ?? this.core,
        length: length ?? this.length,
      );

  factory WandModel.fromJson(Map<String, dynamic> json) => WandModel(
        wood: json["wood"],
        core: json["core"],
        length: json["length"]?.toDouble(),
      );
}
