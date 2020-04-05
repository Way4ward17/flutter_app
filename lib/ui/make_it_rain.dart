import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MakeItRainState();
  }
}
class MakeItRainState extends State<MakeItRain>{

  int _moneycount = 0;
  void _rainmoney(){
    setState(() {
      _moneycount = _moneycount + 100;
      if(_moneycount > 2000){
_moneycount = 0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make it rain"),
        backgroundColor: Colors.lightGreen,
      ),

      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text("Get Rich!",
              style: new TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 29.9
              ),
              ),
            ),


            new Expanded(
                child: new Center(
                  child: new Text("\N$_moneycount",
                  style: new TextStyle(
                    color: _moneycount < 200
                        
                        ? Colors.greenAccent : Colors.red,
                    fontSize: 46.9,
                    fontWeight: FontWeight.w800
                  ),
                  )
            )),


            new Expanded(
                child: new Center(
                  child: new FlatButton(
                    color: Colors.red,
                      onPressed: _rainmoney,
                      child: new Text("CLICK ME",
                      style: new TextStyle(
                        fontSize: 20
                      ),)),
                )),


    ],
        ),
      ),

    );
  }


}
