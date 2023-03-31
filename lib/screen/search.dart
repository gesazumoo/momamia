import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              SearchBar(),
              SizedBox(
                height: 10,
              ),
              Text('결과페이지 list..'),
            ],
          ),
        ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.symmetric(
          horizontal: BorderSide(width: 1, color: Colors.blue.shade300),
          vertical: BorderSide(width: 1, color: Colors.blue.shade300),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              autofocus: true,
              maxLength: 10,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue.shade300,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              print('dd');
            },
            child: Icon(
              CupertinoIcons.search,
              size: 30,
              color: Colors.blue.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
