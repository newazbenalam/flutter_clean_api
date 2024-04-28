// Export files for the models of user_list
import 'package:flutter_clean_api/features/user_list/data/models/wand_model.dart';
import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';
import 'dart:convert';

class UsersModel extends UserEntity {
  UsersModel(
      {required super.id,
      required super.name,
      required super.alternateNames,
      required super.species,
      required super.gender,
      required super.house,
      required super.dateOfBirth,
      required super.yearOfBirth,
      required super.wizard,
      required super.ancestry,
      required super.eyeColour,
      required super.hairColour,
      required super.wand,
      required super.patronus,
      required super.hogwartsStudent,
      required super.hogwartsStaff,
      required super.actor,
      required super.alternateActors,
      required super.alive,
      required super.image});

  UsersModel copyWith({
    String? id,
    String? name,
    List<String>? alternateNames,
    String? species,
    String? gender,
    String? house,
    String? dateOfBirth,
    int? yearOfBirth,
    bool? wizard,
    String? ancestry,
    String? eyeColour,
    String? hairColour,
    WandModel? wand,
    String? patronus,
    bool? hogwartsStudent,
    bool? hogwartsStaff,
    String? actor,
    List<String>? alternateActors,
    bool? alive,
    String? image,
  }) =>
      UsersModel(
        id: id ?? this.id,
        name: name ?? this.name,
        alternateNames: alternateNames ?? this.alternateNames,
        species: species ?? this.species,
        gender: gender ?? this.gender,
        house: house ?? this.house,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        yearOfBirth: yearOfBirth ?? this.yearOfBirth,
        wizard: wizard ?? this.wizard,
        ancestry: ancestry ?? this.ancestry,
        eyeColour: eyeColour ?? this.eyeColour,
        hairColour: hairColour ?? this.hairColour,
        wand: wand ?? this.wand, // Changed from wandModel to wand
        patronus: patronus ?? this.patronus,
        hogwartsStudent: hogwartsStudent ?? this.hogwartsStudent,
        hogwartsStaff: hogwartsStaff ?? this.hogwartsStaff,
        actor: actor ?? this.actor,
        alternateActors: alternateActors ?? this.alternateActors,
        alive: alive ?? this.alive,
        image: image ?? this.image,
      );

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        name: json["name"],
        alternateNames:
            List<String>.from(json["alternate_names"].map((x) => x)),
        species: json["species"],
        gender: json["gender"],
        house: json["house"],
        dateOfBirth: json["dateOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        wizard: json["wizard"],
        ancestry: json["ancestry"],
        eyeColour: json["eyeColour"],
        hairColour: json["hairColour"],
        wand: WandModel.fromJson(json["wand"]),
        patronus: json["patronus"],
        hogwartsStudent: json["hogwartsStudent"],
        hogwartsStaff: json["hogwartsStaff"],
        actor: json["actor"],
        alternateActors:
            List<String>.from(json["alternate_actors"].map((x) => x)),
        alive: json["alive"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternate_names": List<dynamic>.from(alternateNames.map((x) => x)),
        "species": species,
        "gender": gender,
        "house": house,
        "dateOfBirth": dateOfBirth,
        "yearOfBirth": yearOfBirth,
        "wizard": wizard,
        "ancestry": ancestry,
        "eyeColour": eyeColour,
        "hairColour": hairColour,
        "wand": wand.toJson(),
        "patronus": patronus,
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alternate_actors": List<dynamic>.from(alternateActors.map((x) => x)),
        "alive": alive,
        "image": image,
      };
}

List<UsersModel> userModelFromJson(String str) =>
    List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String userModelToJson(List<UsersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
