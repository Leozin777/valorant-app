class RoleDto {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  RoleDto({this.uuid, this.displayName, this.description, this.displayIcon, this.assetPath});

  factory RoleDto.fromJson(Map<String, dynamic> json) => RoleDto(
    uuid: json['uuid'],
    displayName: json['displayName'],
    description: json['description'],
    displayIcon: json['displayIcon'],
    assetPath: json['assetPath'],
  );

  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'displayName': displayName,
    'description': description,
    'displayIcon': displayIcon,
    'assetPath': assetPath,
  };
}