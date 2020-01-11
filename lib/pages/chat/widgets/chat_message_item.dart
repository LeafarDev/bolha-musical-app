import 'package:bolha_musical/model/Message.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class ChatMessageItem extends StatelessWidget {
  final double width;
  final double height;
  final Message message;

  const ChatMessageItem({Key key, this.width, this.height, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(vertical: 1.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(3.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: const Offset(0.0, 4.0),
            ),
          ],
        ),
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(message.getImage())),
          subtitle: Text(
            EmojiParser().emojify(message.msg),
            style: TextStyle(color: Colors.white),
          ),
          title: Text(
            EmojiParser().emojify(
                message.u.name != null ? message.u.name : message.u.username),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
