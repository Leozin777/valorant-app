import 'dart:convert';

import 'package:valorant_app/constants.dart';
import 'package:valorant_app/data/models/agent_dto.dart';
import 'package:http/http.dart' as http;

class AgentsService {
  Future<List<AgentDto>> getAgents() async {
    final agentsUrl =
        Uri.parse('${UrlBase}agents?language=en-US&isPlayableCharacter=true');
    final response = await http.get(agentsUrl);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      final List<AgentDto> agents = data.map<AgentDto>((json) => AgentDto.fromJson(json)).toList();
      return agents;
    } else {
      throw Exception('Failed to load agents');
    }
  }
}
