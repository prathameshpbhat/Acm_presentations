import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kisan/DIsplay_Screen.dart';
import 'package:firebase_database/firebase_database.dart';
void main()
{
  runApp(homepage_main());
}
class homepage_main extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homepage_main();
  }
  
}
class _homepage_main extends State<homepage_main>
{
  TextEditingController userId=TextEditingController();
TextEditingController pass=TextEditingController();
final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
     body:Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
       
        
          colors: <Color>[
              Colors.orange,
              Colors.yellow,
           

          ]

        )
      ),
      
      child:Column(
     mainAxisAlignment: MainAxisAlignment.start,
     children: <Widget>[
       SizedBox(
         height:50.0 ,
       ),
       Text(
         
         "Login",
      
         textDirection: TextDirection.ltr,
      style:TextStyle(color: Colors.white,
      fontSize: 30.0)
       ),
        Text(
         
         "Welcome Onboard",
      
         textDirection: TextDirection.ltr,
      style:TextStyle(color: Colors.white,

      fontSize: 20.0)
       ),
      SizedBox(
        height: 100.0,
      ),
        Expanded(
          
          child:Container(
            width: double.infinity,
            height: double.infinity,
              
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(150.0),),
          color: Colors.white
        ),
  child:ListView(
    children: <Widget>[
      SizedBox(
        height: 40.0,
      ),
        Container(
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 243, 243, 1),
                     borderRadius: BorderRadius.circular(15.0),
                      
                    ),
                    child: TextField(
                      controller:userId ,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.supervised_user_circle,
                          color: Colors.green,),
                          hintText: "Enter userId here!",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0
                          )
                        
                         ),
                    ),
                   
                  ),
 
        Container(
                    margin: EdgeInsets.only(top: 0.0,left: 30.0,right: 30.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 243, 243, 1),
                     borderRadius: BorderRadius.circular(15.0),
                      
                    ),
                    child: TextField(
                       obscureText: true,
                          controller:pass ,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,
                          color: Colors.green,),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0
                          )
                        
                         ),
                    ),
                   
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        gradient: LinearGradient(
       
        
          colors: <Color>[
              Colors.orange,
              Colors.yellow,
           

          ]

        )
      ),
                  child:Builder(
                  builder: (context) => Center( 
                    child:MaterialButton(
                  
                    child: Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                    ), onPressed: () {
                  movetonextstate();
                                           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    onLongPress: ()
                    {
            
                    },
                  ),
                  ),
                  ),
                  ),
                  
    ],
  ),
      ),
      
        ),

     ],
      ),
     ),
     ),
    );
  }
  void movetonextstate() async
  {
    databaseReference.child("Consumer").set({
    'Name': userId.text,
    'pass': pass.text,
    
    'Phone': '-',
'Location': '-',
    
  });

 
  }
}