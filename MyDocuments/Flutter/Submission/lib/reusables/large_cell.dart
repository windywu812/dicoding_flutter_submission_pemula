import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LargeCell extends StatelessWidget {
  final String name;
  final String backgroundImage;
  final double height;
  final double width;

  const LargeCell(
      {Key key,
      @required this.name,
      @required this.backgroundImage,
      @required this.height,
      @required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              placeholder: (context, url) => Container(
                color: Colors.grey,
              ),
              imageUrl: backgroundImage,
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
