import 'dart:convert';

import 'package:valorant_app/data/models/map_dto.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class MapService {
  Future<List<MapDto>> getMaps() async {
    final mapUrl =
        Uri.parse('${UrlBase}maps?language=en-US&isPlayableCharacter=true');
    final response = await http.get(mapUrl);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      final List<MapDto> agents =
          data.map<MapDto>((json) => MapDto.fromJson(json)).toList();
      return agents;
    } else {
      throw Exception('Failed to load maps');
    }
  }
}
