import 'package:flutter/material.dart';

import '../widget/radial_progress.dart';

class CircularsGraphsPage extends StatefulWidget {
  const CircularsGraphsPage({Key? key}) : super(key: key);

  @override
  State<CircularsGraphsPage> createState() => _CircularsGraphsPageState();
}

class _CircularsGraphsPageState extends State<CircularsGraphsPage> {
  late double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh_sharp),
            onPressed: () {
              setState(() {
                percentage += 10;
                if (percentage > 100) {
                  percentage = 0;
                }
              });
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                CustomRadialProgress(percentage: percentage, primaryColor: Colors.amber,),
                CustomRadialProgress(percentage: percentage, primaryColor: Colors.cyan,)
              ],
            ),
            Row(
              children: <Widget>[
                CustomRadialProgress(percentage: percentage, primaryColor: Colors.purple,),
                CustomRadialProgress(percentage: percentage, primaryColor: Colors.red,)
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key? key,
    required this.percentage, 
    required this.primaryColor,
  }) : super(key: key);

  final double percentage;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: primaryColor,
        secondaryColor: Colors.black,
        primaryGirth: 10,
        secondaryGirth: 10,
        // child: Text('$percentage %', style: const  TextStyle(fontSize: 50.0)) )
      ),
    );
  }
}
