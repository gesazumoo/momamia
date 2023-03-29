import 'package:flutter/cupertino.dart';
import 'package:momamia/model/kindergarten.dart';
import 'package:momamia/services/api_service.dart';

class Kindergarten extends StatelessWidget {
  Kindergarten({super.key});

  late Future<List<KindergartenModel>> kindergarten =
      ApiService.getKindergartens();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: kindergarten,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (var da in snapshot.data!) {
              print(da.id);
            }

            return const Text('dd');
          } else {
            return const Text('dd');
          }
        });
  }
}
