import 'package:designs_1/src/widget/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HeaderCurves());
  }
}
//PROYECTO EMERGENCY APP LAYOUT
//TODO NO PASAR ESTA LINEA DE CODIGO

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color color1, color2;

  const IconHeader(
      {required this.icon,
      required this.title,
      required this.subtitle,
      this.color1 = Colors.blue,
      this.color2 = Colors.pink});

  @override
  Widget build(BuildContext context) {
    final Color whiteColor = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderBackground( color1: color1, color2: color2),
        Positioned(
            top: -30,
            left: -30,
            child:
                FaIcon(icon, size: 200, color: Colors.white.withOpacity(0.2))),
        Column(
          children: <Widget>[
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(title, style: TextStyle(fontSize: 20, color: whiteColor)),
            const SizedBox(height: 20),
            Text(subtitle,
                style: TextStyle(
                    fontSize: 27,
                    color: whiteColor,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            FaIcon(icon, size: 80, color: Colors.white)
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1, color2;
  const _IconHeaderBackground({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: const  BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[color1, color2])),
    );
  }
}
