import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/base_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends BaseScreen {
  HomeState createState() => HomeState();
}

class HomeState extends BaseScreenState {
  List<DropdownMenuItem<int>> listDrop = [];

  void loadData() {
    listDrop.add(new DropdownMenuItem(
      child: new Text('Milimeters'),
      value: 1,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Feet'),
      value: 2,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Kilometers'),
      value: 3,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Inches'),
      value: 4,
    ));
  }

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
    loadData();
    var valueChoose;
    return new Center(
        child: Container(
            child: SizedBox(
                child: ListView(children: <Widget>[
      Container(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Text("CHOOSE TYPE",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 130.0,
                  height: 130.0,
                  child: Card(
                      margin: EdgeInsets.all(10.0),
                      elevation: 8,
                      child: Image.asset(
                        'assets/images/scale.png',
                        alignment: Alignment.center,
                      )),
                ),
                Container(
                  width: 130.0,
                  height: 130.0,
                  child: Card(
                      margin: EdgeInsets.all(10.0),
                      elevation: 8,
                      child: Image.asset(
                        'assets/images/hot.png',
                        alignment: Alignment.center,
                      )),
                ),
                Container(
                  width: 130.0,
                  height: 130.0,
                  child: Card(
                      margin: EdgeInsets.all(10.0),
                      elevation: 8,
                      child: Image.asset(
                        'assets/images/beaker.png',
                        alignment: Alignment.center,
                      )),
                ),
              ],
            )
          ])),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Expanded(
            child: Container(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("From ",
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black))))),
        Expanded(
            child: Container(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("To",
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)))))
      ]),
      Column(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
              width: 150.0,
              height: 50.0,
              child: Text('1',
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.horizontal(),
              )),
          Container(
              width: 150.0,
              height: 50.0,
              child: Text('1000',
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.horizontal(),
              ))
        ]),
        Column(children: <Widget>[
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 150.0,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: new DropdownButton(
                        items: listDrop,
                        hint: Text('Meter: '),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 26,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        // value: valueChoose(),
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
                          });
                        })),
                Container(
                    width: 150.0,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: new DropdownButton(
                        items: listDrop,
                        hint: Text('Centimeter: '),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 26,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
                          });
                        }))
              ]),
        ]),
      ])
    ]))));
  }
}
