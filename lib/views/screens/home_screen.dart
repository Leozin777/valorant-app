import 'package:flutter/material.dart';
import 'package:valorant_app/data/models/agent_dto.dart';
import 'package:valorant_app/data/service/agents_service.dart';
import 'package:valorant_app/data/service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  AuthService _authService = AuthService();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AgentsService _agentsService = AgentsService();
  late Future<List<AgentDto>> _agentsFuture;
  late List<AgentDto> _agents;

  Future<List<AgentDto>> getAgents() async {
    _agents = await _agentsService.getAgents();
    return _agents;
  }

  @override
  void initState() {
    super.initState();
    _agentsFuture = getAgents();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agents"),
          actions: [
            IconButton(
                onPressed: () async {
                  await widget._authService.signOut();
                },
                icon: Icon(Icons.logout)),
          ],
        ),
        body: FutureBuilder<List<AgentDto>>(
          future: _agentsFuture,
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
                    leading: Image.network(_agents[index].displayIcon!),
                    title: Text(_agents[index].displayName!),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(_agents[index].displayIcon!),
                                  Text(_agents[index].displayName!),
                                  Text(_agents[index].description!),
                                ],
                              ),
                            );
                          });
                    });
              },
            );
          },
        ));
  }

}
