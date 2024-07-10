import 'package:flutter/material.dart';
import 'package:valorant_app/data/service/map_service.dart';

import '../../data/models/map_dto.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final MapService _mapService = MapService();
  late Future<List<MapDto>> _mapFuture;
  late List<MapDto> _maps;

  Future<List<MapDto>> getMaps() async {
    _maps = await _mapService.getMaps();
    return _maps;
  }

  @override
  void initState() {
    super.initState();
    _mapFuture = getMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Maps")),
        body: FutureBuilder<List<MapDto>>(
          future: _mapFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(_maps[index].displayIcon ?? "https://e7.pngegg.com/pngimages/81/490/png-clipart-question-mark-question-mark.png"),
                  title: Text(_maps[index].displayName!),
                );
              },
            );
          },
        ));
  }
}
