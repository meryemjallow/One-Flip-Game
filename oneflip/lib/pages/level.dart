import 'package:flutter/material.dart';
import 'package:oneflip/pages/easy.dart';
import 'package:oneflip/pages/home.dart';
import 'package:oneflip/pages/medium.dart';
import 'package:oneflip/pages/hard.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    //Scaffold is a class in flutter which provides many widgets
    // like Drawer, SnackBar, BottomNavigationBar, FloatingActionButton,
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('ONE FLIP',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.green[50],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              height: 570,
              padding: EdgeInsets.only(top: 100),

              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Container(
                      alignment: Alignment.center,
                      height: 100.0,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fixedSize: const Size(150, 60),
                          primary: Colors.yellowAccent, // background (button) color
                          onPrimary: Colors.white,

                        ),
                        onPressed: () => Navigator.pushNamed(context,'/easy' ),
                        child: Text('EASY', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100.0,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fixedSize: const Size(150, 60),
                          primary: Colors.lightBlueAccent, // background (button) color
                          onPrimary: Colors.white,
                          // foreground (text) color
                        ),
                        onPressed: () => Navigator.pushNamed(context,'/medium' ),
                        child: Text('MEDIUM', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100.0,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          fixedSize: const Size(150, 60),
                          primary: Colors.deepOrange, // background (button) color
                          onPrimary: Colors.white,
                          // foreground (text) color
                        ),
                        onPressed: () => Navigator.pushNamed(context,'/hard' ),
                        child: Text('HARD', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Page1(
                //size: level,
              ),
            ),
          );
        },
        backgroundColor: Colors.blue[400],

        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}