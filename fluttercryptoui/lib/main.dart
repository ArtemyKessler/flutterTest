import 'package:flutter/material.dart';
import 'package:fluttercryptoui/bid.dart';
import 'package:fluttercryptoui/cityTime.dart';
import 'package:fluttercryptoui/language.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey[800],
        cardColor: Colors.blueGrey[600],
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> menuOptions = [
    'Deposit',
    'Withdraw',
    'Finance',
    'Profile management',
    'Education'
  ];
  List<Language> languages = [
    Language(name: "English", pic: "images/english.png"),
    Language(name: "Русский", pic: "images/russian.png")
  ];
  String pickedShowMode = "All";
  bool drawerIntrumentsPicked = true;
  List<Bid> drawerBids = [
    Bid(up: true, bid: 110000005, ask: 1234340040, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 1234340040, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 1234340040, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 11234340040452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 1234340040, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 1234340040, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
  ];
  int peopleOnline = 1337;
  static int hoursAmount = 7;
  static int minutesAmount = 26;
  List<CityTime> cities = [
    CityTime(name: "NY", time: TimeOfDay(hour: hoursAmount, minute: 12)),
    CityTime(
        name: "London",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
    CityTime(
        name: "Frankfurt",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
    CityTime(
        name: "Moscow",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
    CityTime(
        name: "Tokyo",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
    CityTime(
        name: "Sydney",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: FlatButton(
          onPressed: () {
            // TODO implement callback
            print("logo pressed");
          },
          child: Image.asset('images/logo.png',
              height: 30.0, fit: BoxFit.scaleDown)),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(color: Colors.grey[500], width: 0.5),
          )),
          child: PopupMenuButton<String>(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white)
              ],
            ),
            onSelected: (String menuOption) {
              //TODO implement callback on select
              print(menuOption);
            },
            itemBuilder: (BuildContext context) {
              return menuOptions.map((String option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          // padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.grey[500], width: 0.5))),
          child: FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // TODO implement callback
                print("press deposit");
              },
              child: Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.greenAccent)),
                child: Text("Deposit",
                    style: TextStyle(color: Colors.greenAccent, fontSize: 12)),
              )),
        ),
        Container(
          width: 30,
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.grey[500], width: 0.5))),
          child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.headset_mic,
                size: 14,
              ),
              onPressed: () {
                // TODO implement callback
                print("tech support press");
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(color: Colors.grey[500], width: 0.5),
          )),
          child: PopupMenuButton<String>(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Lang",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white)
              ],
            ),
            onSelected: (String menuOption) {
              //TODO implement callback on select
              print(menuOption);
            },
            itemBuilder: (BuildContext context) {
              return languages.map((Language option) {
                return PopupMenuItem<String>(
                  value: option.name,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(option.pic),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(option.name,
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(color: Colors.grey[500], width: 0.5),
          )),
          child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.exit_to_app,
                size: 16,
              ),
              onPressed: () {
                // TODO implement callback
                print("press exit");
              }),
        )
      ],
      backgroundColor: Theme.of(context).primaryColor,
      titleSpacing: 0.0,
    );
  }

  Widget _drawer() {
    return (Drawer(
        child: Container(
      padding: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: 180.0,
              child: _drawerHeader()),
          Expanded(
              child: Container(
            color: Colors.blueGrey[800],
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.zero,
            child: _tableList(),
          ))
        ],
      ),
    )));
  }

  Widget _drawerHeader() {
    List<String> showTypes = [
      'All',
      'Fiat',
      'Commodities',
      'Equities',
      'Crypto'
    ];
    return DrawerHeader(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PopupMenuButton<String>(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.white)),
                      ),
                      child: Text("Show: $pickedShowMode",
                          style: TextStyle(color: Colors.white)),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white)
                  ],
                ),
                onSelected: (String menuOption) {
                  //TODO implement callback on select
                  setState(() {
                    pickedShowMode = menuOption;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return showTypes.map((String option) {
                    return PopupMenuItem<String>(
                      value: option,
                      child:
                          Text(option, style: TextStyle(color: Colors.white)),
                    );
                  }).toList();
                },
              ),
              Expanded(
                  child: TextField(
                onChanged: (String text) {
                  print("change drawer search");
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                  color: drawerIntrumentsPicked
                      ? Colors.brown[300]
                      : Colors.transparent,
                  onPressed: () {
                    // TODO implement callback
                    print("press intruments");
                    setState(() {
                      drawerIntrumentsPicked = true;
                    });
                  },
                  child: Text(
                    "Instruments",
                    style: TextStyle(color: Colors.white),
                  )),
              FlatButton(
                  color: drawerIntrumentsPicked
                      ? Colors.transparent
                      : Colors.brown[300],
                  onPressed: () {
                    // TODO implement callback
                    print("press favorites");
                    setState(() {
                      drawerIntrumentsPicked = false;
                    });
                  },
                  child:
                      Text("Favorites", style: TextStyle(color: Colors.white)))
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(color: Colors.blueGrey[800]),
    );
  }

  Widget _tableList() {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 430,
      width: 300,
      child: ListView(
        padding: EdgeInsets.zero,
        children: _listRows(),
      ),
    );
  }

  List<Widget> _listRows() {
    TextStyle orangeStyle = TextStyle(color: Colors.orange);
    List<Widget> allRows = [];
    Widget initialRow = Card(
      margin: EdgeInsets.zero,
      elevation: 10,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black, width: 1.0),
          ),
          color: Colors.blueGrey[900],
        ),
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text("Symbol", style: orangeStyle),
            ),
            Text("Bid", style: orangeStyle),
            Container(
              margin: EdgeInsets.only(right: 40),
              child: Text("Ask", style: orangeStyle),
            )
          ],
        ),
      ),
    );
    var rows = drawerBids.map((Bid bid) {
      return Container(
        height: 28,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black, width: 1.0),
          ),
          color: Colors.blueGrey[900],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 3.0),
                    width: 20,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 14,
                        ),
                        onPressed: () {
                          // TODO implement callback
                          print("press drawer star");
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 4.0),
                    child: Icon(
                      bid.up ? Icons.arrow_upward : Icons.arrow_downward,
                      color: bid.up ? Colors.greenAccent : Colors.red,
                      size: 14,
                    ),
                  ),
                  Text(
                    bid.symbol,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            ),
            Container(
              child: Text(bid.bid.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  bid.ask.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 12,
                    ),
                    onPressed: () {
                      // TODO implement callback
                      print('press drawer list arrow');
                    })
              ],
            ))
          ],
        ),
      );
    });
    allRows.add(initialRow);
    rows.toList();
    allRows.addAll(rows);
    return allRows;
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Container(
            height: 18,
            color: Colors.grey[800],
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 4.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.people_outline,
                        color: Colors.green,
                        size: 14,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2.0),
                        child: Text(
                          peopleOnline.toString(),
                          style: TextStyle(color: Colors.green, fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 4.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _cities(),
                  ),
                ))
              ],
            ))
      ],
    );
  }

  List<Widget> _cities() {
    return cities.map((CityTime city) {
      return Container(
        margin: EdgeInsets.only(left: 4.0, right: 4.0),
        child: Row(
          children: <Widget>[
            Text(
              '${city.name}: ',
              style: TextStyle(fontSize: 10, color: Colors.yellowAccent),
            ),
            Text(
              '${city.time.hour}:${city.time.minute}',
              style: TextStyle(fontSize: 10, color: Colors.white),
            )
          ],
        ),
      );
    }).toList();
  }
}
