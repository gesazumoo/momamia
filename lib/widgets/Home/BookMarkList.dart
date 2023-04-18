import 'package:flutter/material.dart';
import 'package:momamia/model/kindergarten.dart';

class BookMarkList extends StatelessWidget {
  const BookMarkList({
    super.key,
    required this.kindergarten,
  });

  final Future<List<KindergartenModel>> kindergarten;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder(
        future: kindergarten,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return KinderCard(name: snapshot.data![index].name);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
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
        },
      ),
    );
  }
}

class KinderCard extends StatelessWidget {
  const KinderCard({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                // color: Colors.gray,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
                fit: BoxFit.cover,
                width: 230,
                height: 130,
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          ),
          const Text('오늘메뉴만이라도~~~~'),
          Text(name),
        ],
      ),
    );
  }
}
