import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/base_screen.dart';
import 'package:flutter_application_2/screens/volume.dart';
import 'package:hexcolor/hexcolor.dart';

class Temperature extends BaseScreen {
  TemperatureState createState() => TemperatureState();
}

class TemperatureState extends BaseScreenState {
  List<DropdownMenuItem<int>> listDrop = [];

  void loadData() {
    listDrop.add(new DropdownMenuItem(
      child: new Text('Censius'),
      value: 1,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Fahrenheit'),
      value: 2,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Kalvin'),
      value: 3,
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
    return Center(
        child: Container(
            child: SizedBox(
                child: ListView(children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: 30, bottom: 0, left: 0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 470,
                    // margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: Text("CHOOSE TYPE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.1))),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        splashColor: Colors.black12,
                        child: Container(
                          width: 130.0,
                          height: 135.0,
                          child: Card(
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 30, left: 5, right: 5),
                              elevation: 8,
                              child: Column(children: <Widget>[
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/scaleBW.png',
                                    alignment: Alignment.center,
                                  ),
                                ),
                                Text('Length',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black12)),
                              ])),
                        ),
                        onDoubleTap: () {},
                      ),
                      Row(children: <Widget>[
                        InkWell(
                          splashColor: Colors.red,
                          child: Container(
                              width: 130.0,
                              height: 135.0,
                              child: Card(
                                  margin: EdgeInsets.only(
                                      top: 20, bottom: 30, left: 5, right: 5),
                                  elevation: 8,
                                  child: Column(children: <Widget>[
                                    Expanded(
                                        child: Image.asset(
                                      'assets/images/hotC.png',
                                      alignment: Alignment.center,
                                    )),
                                    Text('Temperature',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red)),
                                  ]))),
                          onDoubleTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Volume()),
                            );
                          },
                        )
                      ]),
                      Row(children: <Widget>[
                        InkWell(
                          splashColor: Colors.black12,
                          child: Container(
                            width: 130.0,
                            height: 135.0,
                            child: Card(
                                margin: EdgeInsets.only(
                                    top: 20, bottom: 30, left: 5, right: 5),
                                elevation: 8,
                                child: Column(children: <Widget>[
                                  Expanded(
                                      child: Image.asset(
                                    'assets/images/beaker.png',
                                    alignment: Alignment.center,
                                  )),
                                  Text('Volume',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black12)),
                                ])),
                          ),
                          onTap: () {},
                        )
                      ])
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 120,
                        margin: EdgeInsets.only(right: 30),
                        child: Text('From',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54)),
                      ),
                      Container(
                        width: 120,
                        margin: EdgeInsets.only(right: 40),
                        child: Text('To',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54)),
                      )
                    ]),
                Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 150.0,
                            height: 40.0,
                            child: Text('0',
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
                            height: 40.0,
                            child: Text('32',
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
                              height: 40.0,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: new DropdownButton(
                                  items: listDrop,
                                  hint: Text('Celsius: '),
                                  dropdownColor: Colors.white,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 26,
                                  isExpanded: true,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                  //value: valueChoose(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueChoose = newValue;
                                    });
                                  })),
                          Container(
                              width: 150.0,
                              height: 40.0,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: new DropdownButton(
                                  items: listDrop,
                                  hint: Text('Fahrenheit: '),
                                  dropdownColor: Colors.white,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 26,
                                  // isExpanded: true,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                  value: valueChoose,
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueChoose = FocusHighlightMode;
                                    });
                                  }))
                        ]),
                  ]),
                ])
              ]))
    ]))));
  }
}
