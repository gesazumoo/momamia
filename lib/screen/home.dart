import 'package:flutter/material.dart';
import 'package:momamia/model/kindergarten.dart';
import 'package:momamia/services/api_service.dart';
import 'package:momamia/widgets/Home/BookMarkList.dart';
import 'package:momamia/widgets/Home/KindergartenList.dart';

class Home extends StatelessWidget {
  Home({super.key});

  late Future<List<KindergartenModel>> kindergarten =
      ApiService.getKindergartens();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          Expanded(flex: 1, child: BookMarkList(kindergarten: kindergarten)),
          Expanded(
              flex: 2, child: KindergartenList(kindergarten: kindergarten)),
        ],
      ),
    );
  }
}
