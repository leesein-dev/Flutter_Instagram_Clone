import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            type: AvatarType.TYPE3,
            nickname: 'dlwldms',
            size: 40,
            thumPath:
                "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/7mo5/image/RhMj77_UZ1G9smD_INrbLKRVVoc.jpg",
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      imageUrl: 'https://image.msscdn.net/data/curating/16948/16948_1_org.jpg',
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon,
                width: 65,
              ),
              const SizedBox(
                width: 15,
              ),
              ImageData(
                IconsPath.replyIcon,
                width: 60,
              ),
              const SizedBox(
                width: 15,
              ),
              ImageData(
                IconsPath.directMessage,
                width: 55,
              ),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 50,
          ),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "좋아요 150개",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ExpandableText(
            '콘텐츠1입니다.\n콘텐츠1입니다.\n콘텐츠1입니다.\n콘텐츠1입니다.\n콘텐츠1입니다.\n',
            prefixText: 'dlwldms',
            onPrefixTap: () {
              print('아이유 페이지로 이동');
            },
            prefixStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Text(
          '댓글 199개 모두 보기',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Text(
        '1일전',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 11,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(
            height: 15,
          ),
          _image(),
          const SizedBox(
            height: 15,
          ),
          _infoCount(),
          const SizedBox(
            height: 15,
          ),
          _infoDescription(),
          const SizedBox(
            height: 15,
          ),
          _replyTextBtn(),
          _dateAgo(),
        ],
      ),
    );
  }
}
