import 'package:flutter/material.dart';
import 'dart:async';
// imported te flipcard package to provides the flip animation
//and we difined it in the pubspec.yaml
import 'package:flip_card/flip_card.dart';
import 'package:oneflip/pages/level.dart';
import 'package:oneflip/pages/easy.dart';


class hard extends StatefulWidget {

  const hard({Key? key}) : super(key: key);
  @override
  _hardState  createState() => _hardState();
}


class _hardState extends State<hard> {

  //GlobalKey is a key that is unique across the entire app
  // Global keys uniquely identify elements
  //It provides access to other objects that are associated with
  // and to keep track of their state
  List<GlobalKey<FlipCardState>> stateKeys = [];

  //if the cards are finished (all flipped)
  List<bool> cards = [];
  List<String> emojis = [
    'assets/images/im3.jpg',
    'assets/images/im3.jpg',
    'assets/images/im4.jpg',
    'assets/images/im4.jpg',
    'assets/images/im5.jpg',
    'assets/images/im5.jpg',
    'assets/images/im6.jpg',
    'assets/images/im6.jpg',
    'assets/images/im7.jpg',
    'assets/images/im7.jpg',
    'assets/images/im9.jpg',
    'assets/images/im9.jpg',
    'assets/images/im10.jpg',
    'assets/images/im10.jpg',
    'assets/images/im11.jpg',
    'assets/images/im11.jpg',
    'assets/images/im12.jpg',
    'assets/images/im12.jpg',
    'assets/images/im13.jpg',
    'assets/images/im13.jpg',
  ];


  bool flipped = false;//bool variable storing whether card is flipped or not
  int previous_index = -1;//because index is 0 and previous is the one before

  //'timeCount' a variable whith timer type. ıts keeps updating each second until user exit
  late Timer timeCount;
  int time = 0;


  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 20; i++) {
      stateKeys.add(GlobalKey<FlipCardState>());
      cards.add(true);//adding cards state one by one
    }
    startTimer();

//the shuffle function is making the order of images random each time pages loads
    emojis.shuffle();
  }

  startTimer() {
    timeCount = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        time = time + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold is a class in flutter which provides many widgets
    // like Drawer, SnackBar, BottomNavigationBar, FloatingActionButton,
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('MEDIUM LEVEL',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
            children: <Widget>[

              Container(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),

                  child: Text(
                      "$time SECONDS",style: TextStyle(fontSize: 15,
                    fontWeight: FontWeight.bold,)
                    //style: Theme.of(context).textTheme.display2,
                  ),
                ),

              ),
              Expanded(
                //flex: 3,
                child: GridView.builder(
                  padding: EdgeInsets.all(45.0),
                  itemCount: 20,
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),

                  //FlipCard function providing flipcard animation
                  itemBuilder: (context, index) => FlipCard(

                    //taking the statekeys array as the key
                    //define the key to be statekey
                    key: stateKeys[index],
                    onFlip: () {

                      if (!flipped) {
                        flipped = true;
                        previous_index = index;//assigning the current index to the previous
                      } else {
                        flipped = false;
                        if (previous_index != index) {
                          if (emojis[previous_index] != emojis[index]) {
                            stateKeys[previous_index]
                                .currentState
                                ?.toggleCard();
                            previous_index = index;
                          } else {
                            cards[previous_index] = false;
                            cards[index] = false;
                            print(cards);

                            if (cards.every((t) => t == false)) {
                              print("Won");
                              showResult();
                            }
                          }
                        }
                      }
                    },
                    direction: FlipDirection.HORIZONTAL,
                    flipOnTouch: cards[index],
                    front: Container(
                      margin: EdgeInsets.all(0.5),
                      //color: Colors.brown.withOpacity(0.3),
                      child: Image.asset(
                        'assets/images/qm.jpg',
                      ),
                    ),
                    back: Container(
                      margin: EdgeInsets.all(0.5),
                      //color: Colors.deepOrange,
                      child: Center(
                        child: Image.asset(
                            emojis[index]),
                      ),
                    ),
                  ),
                ),

              ),
              Container(
                alignment: Alignment.center,

                child: ElevatedButton(
                  child: Text('Exit',style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,)
                  ),

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    fixedSize: const Size(100, 60),
                    primary: Colors.blue[400], // background (button) color
                    onPrimary: Colors.black,
                  ),
                  onPressed: () async {
                    String? response = await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content:  Text('Are you sure to exit?'),
                          actions: <Widget>[
                            ElevatedButton(
                              child:  Text('Yes'),

                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                primary: Colors.blue[400],
                              ),

                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => Page2(
                                      //size: level,
                                    ),
                                  ),
                                );
                              },
                            ),
                            ElevatedButton(
                                child:  Text('No'),

                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  primary: Colors.blue[400],
                                ),

                                onPressed: () => Navigator.pop(context, 'No')),
                          ],
                        );
                      },
                    );
                    // Do things with the response that we 'await'ed above.
                    print(response);
                  },
                ),
              ),
            ]
        ),

      ),
    );
  }

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children:[
           Text('FINISHED', style: TextStyle(color: Colors.blue[400]),),

          Image.asset(
            'assets/images/trophy.jpg',width: 30, height: 30,fit: BoxFit.contain,
          ),
          Image.asset(
            'assets/images/trophy.jpg',width: 30, height: 30,fit: BoxFit.contain,
          ),
          Image.asset(
            'assets/images/trophy.jpg',width: 30, height: 30,fit: BoxFit.contain,
          ),

        ]
    ),
        content: Text(
          "Do you want to start over",
          // style: Theme.of(context).textTheme.display2,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => easy(
                    //size: level,
                  ),
                ),
              );

            },
            child: Text("YES", style: TextStyle(color: Colors.blue[400]),),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => hard(
                    //size: level,
                  ),
                ),
              );

            },
            child: Text("NO", style: TextStyle(color: Colors.blue[400]),),
          ),
        ],
      ),
    );
  }
}

void showResult() {
}
