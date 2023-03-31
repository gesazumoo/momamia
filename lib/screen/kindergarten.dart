import 'package:flutter/material.dart';
import 'package:momamia/model/kindergarten.dart';
import 'package:momamia/services/api_service.dart';

class Kindergarten extends StatelessWidget {
  Kindergarten({super.key});

  late Future<List<KindergartenModel>> kindergarten =
      ApiService.getKindergartens();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          Expanded(flex: 1, child: Bookmark(kindergarten: kindergarten)),
          Expanded(flex: 2, child: Kindergartens(kindergarten: kindergarten)),
        ],
      ),
    );
  }
}

class Bookmark extends StatelessWidget {
  const Bookmark({
    super.key,
    required this.kindergarten,
  });

  final Future<List<KindergartenModel>> kindergarten;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: kindergarten,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Text(snapshot.data![index].name);
            },
            separatorBuilder: (context, index) {
              return const Text('1');
            },
            itemCount: snapshot.data!.length,
          );
        } else {
          return const Expanded(
            flex: 1,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class Kindergartens extends StatelessWidget {
  const Kindergartens({
    super.key,
    required this.kindergarten,
  });

  final Future<List<KindergartenModel>> kindergarten;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: kindergarten,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return Text(snapshot.data![index].name);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Expanded(
              flex: 1,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
