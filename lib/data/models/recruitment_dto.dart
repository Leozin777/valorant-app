class RecruitmentDto {
  String? counterId;
  String? milestoneId;
  int? milestoneThreshold;
  bool? useLevelVpCostOverride;
  int? levelVpCostOverride;
  DateTime? startDate;
  DateTime? endDate;

  RecruitmentDto({
    this.counterId,
    this.milestoneId,
    this.milestoneThreshold,
    this.useLevelVpCostOverride,
    this.levelVpCostOverride,
    this.startDate,
    this.endDate,
  });

  factory RecruitmentDto.fromJson(Map<String, dynamic> json) => RecruitmentDto(
    counterId: json['counterId'],
    milestoneId: json['milestoneId'],
    milestoneThreshold: json['milestoneThreshold'],
    useLevelVpCostOverride: json['useLevelVpCostOverride'],
    levelVpCostOverride: json['levelVpCostOverride'],
    startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
    endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
  );

  Map<String, dynamic> toJson() => {
    'counterId': counterId,
    'milestoneId': milestoneId,
    'milestoneThreshold': milestoneThreshold,
    'useLevelVpCostOverride': useLevelVpCostOverride,
    'levelVpCostOverride': levelVpCostOverride,
    'startDate': startDate?.toIso8601String(),
    'endDate': endDate?.toIso8601String(),
  };
}