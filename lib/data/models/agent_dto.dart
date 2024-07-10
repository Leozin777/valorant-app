import 'package:valorant_app/data/models/ability_dto.dart';
import 'package:valorant_app/data/models/recruitment_dto.dart';
import 'package:valorant_app/data/models/role_dto.dart';

class AgentDto {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? background;
  String? assetPath;

  AgentDto({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.background,
    this.assetPath
  });

  factory AgentDto.fromJson(Map<String, dynamic> json) => AgentDto(
        uuid: json['uuid'],
        displayName: json['displayName'],
        description: json['description'],
        displayIcon: json['displayIcon'],
        displayIconSmall: json['displayIconSmall'],
        bustPortrait: json['bustPortrait'],
        fullPortrait: json['fullPortrait'],
        fullPortraitV2: json['fullPortraitV2'],
        background: json['background'],
        assetPath: json['assetPath'],
      );
}
