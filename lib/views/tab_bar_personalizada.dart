import 'package:flutter/material.dart';
import 'package:valorant_app/views/screens/home_screen.dart';
import 'package:valorant_app/views/screens/maps_screen.dart';

class TabBarPersonalizada extends StatefulWidget {
  const TabBarPersonalizada({super.key});

  @override
  State<TabBarPersonalizada> createState() => _TabBarPersonalizadaState();
}

class _TabBarPersonalizadaState extends State<TabBarPersonalizada>{
  int _indexPaginaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _paginaSelecionada(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexPaginaSelecionada,
          onTap: _itemTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Agents"),
            BottomNavigationBarItem(icon: Icon(Icons.place), label: "Maps")
          ],
        )
    );
  }

  Widget _paginaSelecionada() {
    switch (_indexPaginaSelecionada) {
      case 0:
        return HomeScreen();
      case 1:
        return const MapsScreen();
      default:
        return const Scaffold(
          body: Center(child: Text("Erro durente a navegação")),
        );
    }
  }

  void _itemTap(int index) {
    setState(() {
      _indexPaginaSelecionada = index;
    });
  }
}