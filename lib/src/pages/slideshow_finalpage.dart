import 'package:designs_1/src/widget/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';


class SlideShowFinal extends StatelessWidget {
  const SlideShowFinal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme     = Provider.of<ThemeChanger>(context); 
    final primaryColor = appTheme.currentTheme.primaryColor;
    return Scaffold(
      body: Slideshow( 
        primaryBullet: 15,
        
        topDots: false,
        activeColor: (appTheme.darkTheme) ? primaryColor :Colors.pink,
        inactiveColor: Colors.grey,
        slides: <Widget> [
SvgPicture.asset('assets/svg/user.svg'),
SvgPicture.asset('assets/svg/proflie.svg'),
SvgPicture.asset('assets/svg/chatting.svg'),
SvgPicture.asset('assets/svg/hooked.svg'),
SvgPicture.asset('assets/svg/post.svg'),
      ])
    );
  }
}