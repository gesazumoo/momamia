import 'package:momamia/model/menu.dart';
import 'package:flutter/material.dart';
import 'package:momamia/screen/menu_detail.dart';

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
          return menuItem(index, context);
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

  GestureDetector menuItem(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MenuDetail(menuId: menuList[index].id),
              fullscreenDialog: true,
            ))
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 150,
        decoration: BoxDecoration(color: Colors.brown.shade100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(menuList[index].eatingDate, style: const TextStyle()),
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
      ),
    );
  }
}
