import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
class Homepage extends StatefulWidget
{
 
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homepage();
  }
  
}
class _homepage extends State<StatefulWidget>
{
  final databaseReference = FirebaseDatabase.instance.reference();
     TextEditingController Amount=TextEditingController();
  int current=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp( 
      title:"UIone",
    home:Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.camera),
          backgroundColor: Colors.black,
title: Text(""),

          
          ),
           BottomNavigationBarItem(icon: Icon(Icons.home),
          backgroundColor: Colors.blue,
          title: Text(""),
          
          ),
           BottomNavigationBarItem(icon: Icon(Icons.card_travel),
          backgroundColor: Colors.red,
          title: Text(""),
          
          ),
          
        ],
onTap: (index)
{
setState(() {
  current=index;
});
},
      ),
   backgroundColor: Color.fromRGBO(244, 243, 243, 1),
   appBar: AppBar(
     backgroundColor: Colors.white,
     brightness: Brightness.light,
     elevation: 0,
     leading: IconButton(
       icon: Icon(Icons.menu,color: Colors.black87,),
        onPressed: () {},

     )

   ),
  body: SafeArea(
    child: ListView(
      
      children: <Widget>[
        Container(
         
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50.0),
            )

          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Align(
               alignment: Alignment.centerLeft,
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
           Text("Meet your",
           
              style:TextStyle(color: Colors.black87,fontSize: 25.0
                  )
                ),
                Text("Requirement",
                style: TextStyle(
                  color: Colors.black,fontSize: 40.0
                ),

                ),
                SizedBox(
                  height: 20.0,
                ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 243, 243, 1),
                     borderRadius: BorderRadius.circular(15.0),
                      
                    ),
                    child: TextField(
                      controller:Amount ,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search your querry",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0
                          )
                        
                         ),
                    ),
                   
                  ),
                   SizedBox(
                      height: 15.0,
                    ),
               ],
             ),
              ),
            ],
          ),
        ),
           SizedBox(
                      height: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal:20.0,
                            ),
                          child: Text("Promo Today",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                          ),
                        ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 200.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            getpromocard("assets/one.jpg"),
                            getpromocard("assets/two.jpg"),
                            getpromocard("assets/three.jpg"),
                            getpromocard("assets/four.jpg"),
                                  getpromocard("assets/four.jpg"),
                                        getpromocard("assets/four.jpg"),
                                              getpromocard("assets/four.jpg"),
                                                    getpromocard("assets/four.jpg"),
                           
                          ],
                        ),
                      ),
                      Container(
                        child:Center(
                           child: TextField(

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          
                          hintText: "Enter Stubble in tons",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0
                          )
                        
                         ),
                    ),
                        )
                      ), Container(
                    margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        gradient: LinearGradient(
       
        
          colors: <Color>[
              Colors.lightGreen,
              Colors.green,
           

          ]

        )
      ),
                  child:Builder(
                  builder: (context) => Center( 
                    child:MaterialButton(
                  
                    child: Text("Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                    ), onPressed: () {
                      movetonextstate();
                    },
                    
                  ),
                  ),
                  ),
                  ),
                      ],
                    ),
                     
        
      ],
    ),

  ) 

    ),
    );
    
  }
Widget getpromocard(String image)
{
  return AspectRatio(
    aspectRatio: 2.3/2.7,
    child: Container(
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.orange,
        image:DecorationImage( 
        image: AssetImage(image),
        fit: BoxFit.cover,
        )
      ),
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          stops: [0.1,0.9],
          colors: <Color>[
            Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.1)
            
          ]

        )
      ),
      ),
    ),

  );
}
  void updateData(){
  databaseReference.child('Consumer').update({
    'Amount': Amount.text,
  });

}
  void movetonextstate() async
  {
    databaseReference.child("Consumer").set({
    'Name': 'Kenan',
    'pass':'1234',
    'Amount':Amount.text,
    'Phone': '7020206186',
'Location': 'Panaji',
    
  });

 
  }
}