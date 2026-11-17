import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ), // BoxDecoration
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.factory,
                  color: Colors.white,
                  size: 42,
                ),
                SizedBox(height: 8,),
                Text("Indústria Alimentícia", style: TextStyle(color: Colors.white))
              ],
            ),
          ), // DrawerHeader
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(' Início '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(' Cadastro '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(' Sair '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}