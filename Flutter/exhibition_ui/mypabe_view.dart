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
          title: Text("마이페이지"),
          leading: Builder(
            builder: (BuildContext context) => (
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {}
              )
            )
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.home_outlined),
              onPressed: () {},
            )
          ]
        ),
        body: Center(
          child: MainView(),
        ),
      ),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  var tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1.5, color: Colors.grey.withOpacity(0.3)))
              ),
              child: TabBar(
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                indicatorColor: Colors.orange,
                onTap: (index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
                tabs: [
                  Center(child: Text("프로필", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                  Center(child: Text("신청현황", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: tabIndex == 0 
                ?  Container(
                  color: Colors.green
                )
                :  Container(
                  color: Colors.blue
                )
            )
          ]
        )
      )
    );
  }
}
