import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white70,
        primarySwatch: Colors.grey,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          )
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
//           elevation: 0.0,
          centerTitle: true
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("1:1 문의하기"),
          leading: Builder(
            builder: (BuildContext context) => (
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {}
              )
            )
          ),
          actions:[
            IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {},
            )
          ]
        ),
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}


class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyWidget extends StatefulWidget {
  MyWidget({Key key}) : super(key: key);

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  
  
  
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.notifications_none_outlined, color: Colors.orange)
              ),
              Expanded(
                flex: 1,
                child: Text('운영시간: 평일 09:00 ~ 18:00 (월요일 제외)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              )
            ]
          )
        ),
        Expanded(
          child:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 13, bottom: 10, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.account_balance_outlined, color: Colors.grey, size: 80),
                      Text('M U S E U M'),
                      SizedBox(height: 12),
                      Text(
                        '코로나19로 인해 고객센터를 잠정적으로\n축소하여 운영 중이오니, 너른 양해부탁드립니다.', 
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16)
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        color: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text('고객센터', style: TextStyle(fontSize: 18, color: Colors.white)),
                        onPressed: () {},
                      )
                    ]
                  )
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _data[index].isExpanded = !isExpanded;
                      });
                    },
                    children: _data.map<ExpansionPanel>((Item item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(item.headerValue),
                          );
                        },
                        body: ListTile(
                          title: Text(item.expandedValue),
                          subtitle: Text('To delete this panel, tap the trash can icon'),
                          trailing: Icon(Icons.delete),
                          onTap: () {
                            setState(() {
                              _data.removeWhere((currentItem) => item == currentItem);
                            });
                          }),
                        isExpanded: item.isExpanded,
                      );
                    }).toList(),
                  )
                )
              ]
            )
          )
        )
      ]
    );
  }
}
