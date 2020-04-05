import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return new HomeState();
  }

}

class HomeState extends State{

  final TextEditingController _weightController = new TextEditingController();
double _finalResult = 0.0;
  int radioValue = 0;


  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          break;
        case 2:

          _finalResult = calculateWeight(_weightController.text, 0.91);
          break;

      }
    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Planet Weight"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png',
            height: 133.0,
              width: 200.0,
            ),



            new Container(
              padding: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      labelText: 'Your weight on Earth',
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),




                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(activeColor: Colors.orange, value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),

                      new Text("Pluto",
                      style: new TextStyle(color: Colors.black),),

                      new Radio<int>(activeColor: Colors.brown,value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text("Mars",
                        style: new TextStyle(color: Colors.black),),

                      new Radio<int>(activeColor: Colors.red,value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text("Earth",
                        style: new TextStyle(color: Colors.black),),

                    ],

                  ),
                  
                  new Padding(padding: new EdgeInsets.all(15.6)),

                  new Text("$_finalResult",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.2,
                    fontWeight: FontWeight.w500

                  ),
                    
                  )

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {

    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    }else{
      print("Wrong");
    }
    return int.parse("100") * 0.38;
  }


}