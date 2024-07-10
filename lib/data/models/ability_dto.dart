class AbilityDto {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  AbilityDto({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  factory AbilityDto.fromJson(Map<String, dynamic> json) => AbilityDto(
    slot: json['slot'],
    displayName: json['displayName'],
    description: json['description'],
    displayIcon: json['displayIcon'],
  );

  Map<String, dynamic> toJson() => {
    'slot': slot,
    'displayName': displayName,
    'description': description,
    'displayIcon': displayIcon,
  };
}