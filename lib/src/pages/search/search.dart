import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/pages/search/search_focus.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];
  int maxList = 100;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < maxList; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!); // grid index
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(10) > 1 ? 1 : 2;
      }
      // maxList의 갯수 끝에 size 2가 들어가면 maxList의 갯수가 끝나면서 2를 처리하지 못하게 되므로
      // maxList의 -10부터는 똑같은 groupIndex가 되면 그만 생성하도록 만듦
      if (i >= (maxList - 10) &&
          gi == groupIndex.indexOf(max<int>(groupIndex)!)) {
        break;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchFocus(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              margin: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text(
                    "검색",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff838383),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(
            15.0,
          ),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jndex],
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'http://img.khan.co.kr/news/2020/10/16/2020101601001687000138341.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ).toList(),
            ),
          ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            Expanded(
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }
}
