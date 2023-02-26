import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageurl = "https://staticc.sportskeeda.com/editor/2022/10/fd2b9-16652598039107-1920.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              //decoration: BoxDecoration(color: Colors.deepPurpleAccent),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("sainath chowdary"),
                accountEmail: Text("Sainathbalaji01@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",style: TextStyle(color: Colors.white),textScaleFactor: 1.2,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",style: TextStyle(color: Colors.white),textScaleFactor: 1.2,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Email me",style: TextStyle(color: Colors.white),textScaleFactor: 1.2,),
            ),
          ],
        ),
      ),
    );
  }
}
