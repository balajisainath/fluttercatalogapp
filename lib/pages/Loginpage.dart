import 'package:flutter/material.dart';
import 'package:flutterapp1/Util/MyRoutes.dart';
import 'package:flutterapp1/pages/Homepage.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  // const Loginpage({Key? key}) : super(key: key);
  var name="";
  bool changebutton=false;
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
              "Welcome $name",
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
                    onChanged: (value){
                      name=value;
                      setState(() {});
                    },
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
                  InkWell(
                    onTap:() async {
                      setState(() {
                        changebutton=true;
                      });
                      await Future.delayed(Duration(milliseconds: 250));
                      Navigator.pushNamed(context,MyRoutes.homeroute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      width: changebutton? 50:150,
                      height: 50,
                     alignment: Alignment.center,
                     child: changebutton ? Icon(Icons.done,color: Colors.white,):Text("login",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),
                     // color: Colors.deepPurpleAccent,
                      decoration:  BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(changebutton? 50.00 : 8.00),
                      ),

                    ),
                  )
                  // ElevatedButton(
                  //   child: Text("login",style: TextStyle(fontSize: 20),),
                  //   style: TextButton.styleFrom(backgroundColor: Colors.deepPurpleAccent,minimumSize: Size(150, 40),),
                  //   onPressed: () {
                  //     //print("login button pressed");
                  //     Navigator.pushNamed(context,MyRoutes.homeroute);
                  //   },
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
