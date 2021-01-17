import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetIcon extends StatelessWidget {
  const GetIcon({@required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/$icon.svg',
      color: Color(0xffE5E9F0),
      height: 300,
    );
  }
}
