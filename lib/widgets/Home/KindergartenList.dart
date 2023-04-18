import 'package:flutter/material.dart';
import 'package:momamia/model/kindergarten.dart';

class KindergartenList extends StatelessWidget {
  const KindergartenList({
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
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade200,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                          offset: Offset(1, 1), // Shadow position
                        ),
                      ],
                    ),
                    child: const Text('dd'),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: snapshot.data!.length,
              ),
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
