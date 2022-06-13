import 'package:flutter/material.dart';
import 'package:oneflip/pages/level.dart';


class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}


class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    //Scaffold is a class in flutter which provides many widgets
    // like Drawer, SnackBar, BottomNavigationBar, FloatingActionButton,
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title:Center(
          child: Text('ONE FLIP',
            style: TextStyle(color: Colors.black),
          ),
        ) ,
      ),
      backgroundColor: Colors.white,

      //SafeArea A widget that insets its child by sufficient padding
      // to avoid intrusions by the operating system
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 2.0, color: Colors.black),
                        bottom: BorderSide(width: 2.0, color: Colors.black),
                      ),
                    ),

                    child: Image(
                      image: AssetImage('assets/images/backgroung1.JPG'),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left:95,
                    height: 150,
                    width: 150,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage('assets/images/qmark.jpg'),
                      ),
                    ),
                  ),
                ]
            ),
            Container(
              alignment: Alignment.center,
              height: 170.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  fixedSize: const Size(150, 60),
                  primary: Colors.black, // background (button) color
                  onPrimary: Colors.white,
                  // foreground (text) color
                ),
                onPressed: () => Navigator.pushNamed(context,'/level' ),
                child: Text('start playing'),
              ),
            )

          ],
        ),
      ),
    );
  }
}