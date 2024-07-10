class MapDto {
  String? displayName;
  String? narrativeDescription;
  String? displayIcon;

  MapDto({
    this.displayName,
    this.narrativeDescription,
    this.displayIcon,
  });

  factory MapDto.fromJson(Map<String, dynamic> json) => MapDto(
    displayName: json['displayName'],
    narrativeDescription: json['narrativeDescription'],
    displayIcon: json['displayIcon'],
  );

  Map<String, dynamic> toJson() => {
    'displayName': displayName,
    'narrativeDescription': narrativeDescription,
    'displayIcon': displayIcon,
  };
}