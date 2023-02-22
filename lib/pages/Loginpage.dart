import 'package:flutter/material.dart';
import 'package:flutterapp1/Util/MyRoutes.dart';
import 'package:flutterapp1/pages/Homepage.dart';

class Loginpage extends StatelessWidget {
  // const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "images/loginimage.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: " Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Paddword",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    child: Text("login",style: TextStyle(fontSize: 20),),
                    style: TextButton.styleFrom(backgroundColor: Colors.deepPurpleAccent,minimumSize: Size(150, 40),),
                    onPressed: () {
                      //print("login button pressed");
                      Navigator.pushNamed(context,MyRoutes.homeroute);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
