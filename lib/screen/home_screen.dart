import 'package:flutter/material.dart';
import 'package:momamia/model/menu.dart';
import 'package:momamia/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  final momaList = [
    '압맥밥 새우바지락들깨국 (9.13.18.) 오리훈제&소스 (1.2.5.6.) 무장아찌숙주무침 배추김치 (9.) 우유 (2.)',
    '흰밥 순두부찌개 (1.5.10.) 시금치무침 어묵잡채 (1.5.6.) 총각김치 (9.) 우유 (2.)',
    '기장밥 냉이된장국 (5.6.) 건파래볶음 (13.) 제육볶음 (5.6.10.13.) 배추김치 (9.) 딸기 우유 (2.)',
    '현미찹쌀밥 감자양파국 (5.6.) 팽이버섯무침 (5.6.13.) 어니언떡갈비 (5.6.10.12.13.15.16.18.) 깍두기 (9.) 우유 (2.)',
    '55555',
    '6666666',
    '777777',
    '8888888',
    '111111',
    '222222',
    '33333',
    '444444',
    '55555',
    '6666666',
    '777777',
    '8888888',
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
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

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
    required this.menuList,
  });

  final List<MenuModel> menuList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 150,
            decoration: BoxDecoration(color: Colors.brown.shade100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(DateUtil().formattedDate(DateTime.parse(menuList[index].createDate)), style: const TextStyle()),
                Text(
                  menuList[index].menu,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('조리사이름'),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: menuList.length,
      ),
    );
  }
}
