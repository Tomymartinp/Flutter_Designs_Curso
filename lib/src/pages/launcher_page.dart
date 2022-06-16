import 'package:designs_1/src/routes/routes.dart';
import 'package:designs_1/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherScreen extends StatelessWidget {
   
  const LauncherScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Designs'),
      ),
      drawer: _MainMenu(),
      body: _OptionsList(),
    );
  }
}


class _OptionsList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  final apptheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: pageRoute.length,
      separatorBuilder: (context, i) => Divider(
        color: apptheme.primaryColor,
      ),
      itemBuilder: (context, i) =>  ListTile(
        leading: FaIcon(pageRoute[i].icon, color: apptheme.colorScheme.secondary),
        title:  Text(pageRoute[i].title),
        trailing:  Icon (Icons.chevron_right, color: apptheme.colorScheme.secondary),
        onTap: (){
         Navigator.push(context, CupertinoPageRoute(builder: (context)=> pageRoute[i].page));
        },
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final appTheme     = Provider.of<ThemeChanger>(context); 
    final primaryColor = appTheme.currentTheme.primaryColor;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                
                height: 150,
                width: double.infinity,
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Text( 'TM', style: TextStyle( fontSize: 40)
                  ),
                ),
              ),
            ),
            Expanded(
              child: _OptionsList()
            ),
            ListTile(
              leading: Icon( Icons.lightbulb, color: primaryColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
              activeColor: primaryColor,
              value: appTheme.darkTheme,
              onChanged: (value) => appTheme.darkTheme = value 
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              right: false,
              left: false,
              child: ListTile(
                leading: Icon( Icons.add_to_home_screen, color: primaryColor),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                activeColor: primaryColor,
                value: appTheme.customTheme,
                onChanged: (value) => appTheme.customTheme = value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}