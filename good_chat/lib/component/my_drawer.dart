import 'package:flutter/material.dart';
import 'package:good_chat/pages/setting_page.dart';
// import 'package:good_chat/service/auto_service.dart';
import '../service/auto_service.dart';
import '../pages/login_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer();

 void logout(BuildContext context) {
    final authService = AuthService();
    authService.signOut().then((_) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false
      );
    }
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: DrawerHeader(
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(40),
                        child: Image.asset(
                        'lib/images/message.png',
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25,top: 10),
                child: ListTile(
                  title: Text('H O M E'),
                  leading: Icon(Icons.home),
                  onTap: (){
                    Navigator.pop(context);
                  },
                  ),
              )
            ],
          ),
           Padding(
                padding: EdgeInsets.only(left: 25,),
                child: ListTile(
                  title: Text("S E T T I N G"),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingPage()
                      ),
                    );
                  } 
                ),
              ),
          Padding(
            padding: EdgeInsets.only(left: 25,bottom: 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap: () => logout(context),
            ),
          ),
         
          
        ],
      ),
    );
  }
}