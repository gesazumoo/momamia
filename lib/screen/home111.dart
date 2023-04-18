import 'package:flutter/material.dart';

import 'package:momamia/services/api_service.dart';
import 'package:momamia/widgets/MenuList.dart';

class Home111 extends StatelessWidget {
  const Home111({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            FutureBuilder(
              future: ApiService.getMenus(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MenuList(menuList: snapshot.data!);
                } else {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
