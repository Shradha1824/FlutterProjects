import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/base_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends BaseScreen {
  HomeState createState() => HomeState();
}

class HomeState extends BaseScreenState {
  Widget getAppBar() {
    return AppBar(
      backgroundColor: HexColor('#446DFF'),
      title: Text(
        'Welcome to quantity measurement',
        style: TextStyle(fontSize: 22.0, color: HexColor('#FFFFFF')),
      ),
      centerTitle: true,
    );
  }

  Widget getBody(BuildContext context) {
    var text = Text('1000',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 10.0, fontWeight: FontWeight.w700, color: Colors.black));
    return Center(
        child: Center(
            child: SizedBox(
                child: ListView(
      children: <Widget>[
        Container(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text("CHOOSE TYPE",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: 120.0,
                      height: 120.0,
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              'assets/images/scale.png',
                              alignment: Alignment.center,
                            )),
                      )),
                  Container(
                      width: 120.0,
                      height: 120.0,
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          'assets/images/hot.png',
                          alignment: Alignment.center,
                        ),
                      ))),
                  Container(
                      width: 120.0,
                      height: 120.0,
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          'assets/images/beaker.png',
                          alignment: Alignment.center,
                        ),
                      ))),
                ],
              )
            ])),
        Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("To",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              Text("From",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          width: 160.0,
                          height: 60.0,
                          child: Card(
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text('1',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))),
                          )),
                    ),
                    Container(
                      width: 160.0,
                      height: 60.0,
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('1000',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black))),
                      ),
                    ),
                  ]),
            ])
      ],
    ))));
  }
}
