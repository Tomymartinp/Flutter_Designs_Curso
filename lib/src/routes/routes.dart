import 'package:designs_1/src/labs/sildeshow_page.dart';
import 'package:designs_1/src/pages/emergency_page.dart';
import 'package:designs_1/src/pages/graphs_circles_pages.dart';
import 'package:designs_1/src/pages/headers_page.dart';
import 'package:designs_1/src/pages/page_animations.dart';
import 'package:designs_1/src/pages/pinterest_page.dart';
import 'package:designs_1/src/pages/sliverlist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoute = <_Route> [
_Route(
FontAwesomeIcons.slideshare,'SlideShow',SlideShowPage()
 ),

_Route(
FontAwesomeIcons.truckMedical,'Emergency',EmergencyScreen()
 ),

_Route(
FontAwesomeIcons.heading,'Heading',HeadersPage()
 ),

_Route(
FontAwesomeIcons.peopleCarryBox,'Square',AnimPage()
 ),

_Route(
FontAwesomeIcons.circle,'Circles Progress',CircularsGraphsPage()
 ),

 _Route(
FontAwesomeIcons.pinterest,'Pinterest',PinterScreen()
 ),

 _Route(
FontAwesomeIcons.mobile,'Slivers',SliverListPage()
 ),








];




class _Route {


final IconData icon;
final String title;
final Widget page;

  _Route(this.icon, this.title, this.page);


}