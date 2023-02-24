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
  final _formkey =GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(milliseconds: 250));
      await Navigator.pushNamed(context, MyRoutes.homeroute);
      setState(() {
        changebutton = false;
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                      validator: (value){
                        if(value!.isEmpty){
                          return "user name is empty";
                        }
                        return null;
                      },
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
                      validator: (value){
                        if(value!.isEmpty){
                          return "password is empty";
                        }
                        else if(value.length<6){
                          return "length atleast 6 plz";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Material(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(changebutton? 50.00 : 8.00),
                      child: InkWell(
                        onTap:()  => movetohome(context),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width: changebutton? 50:150,
                          height: 50,
                         alignment: Alignment.center,
                         child: changebutton ? Icon(Icons.done,color: Colors.white,):Text("login",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),
                         // color: Colors.deepPurpleAccent,
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
      ),
    );
  }
}
