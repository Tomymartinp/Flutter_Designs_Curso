import 'package:animate_do/animate_do.dart';
import 'package:designs_1/src/pages/headers_page.dart';
import 'package:designs_1/src/widget/fat_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String text;
  final Color color1, color2;

  ItemBoton(this.icon, this.text, this.color1, this.color2);
}

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.maskFace, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carBattery, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.maskVentilator, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items.map(
      (items) => FadeInLeftBig(
        duration: Duration( milliseconds: 450),
        child: FatButton(
          icon: items.icon ,
          text: items.text,
          color1: items.color1,
          color2: items.color2,
          onPressed: (){},
        ),
      )
    ).toList();

    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children:  <Widget>[
           const SizedBox(
              height: 80,
            ),
            ...itemMap
          ]),
        ),
        _Header()
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       const IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'REQUEST',
          subtitle: 'Medical Aid',
          color1: Color(0xff6989F5),
          color2: Color(0xff906EF5),
        ),
        Positioned(
          top: 40,
          right: -19,
        child:
        RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          padding: EdgeInsets.all(12),
          child: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white))
         )
      ],
    );
  }
}

class FatButtonTemp extends StatelessWidget {
  const FatButtonTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FatButton(
      icon: FontAwesomeIcons.plane,
      color1: Colors.teal, //0xff6989F5
      color2: Colors.blue, //0xff906EF5
      text: 'Plane Tickets',
      onPressed: () {},
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Request',
      subtitle: 'Medical Aid',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
