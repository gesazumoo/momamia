import 'package:flutter/material.dart';
import 'package:momamia/model/menu.dart';
import 'package:momamia/services/api_service.dart';

class MenuDetail extends StatelessWidget {
  MenuDetail({super.key, required this.menuId});
  final String menuId;

  late Future<MenuModel> menuDetail = ApiService.getMenuDetail(menuId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ddd')),
        body: FutureBuilder(
          future: menuDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Center(
                        child: Text(snapshot.data!.createDate,
                            style: const TextStyle(fontSize: 20))),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: const BoxDecoration(color: Colors.black12),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              snapshot.data!.menu,
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: const BoxDecoration(color: Colors.black26),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(snapshot.data!.note),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text('조리사 : '),
                            Text('조리사1'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text('작성일 : '),
                            Text(snapshot.data!.createDate),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
