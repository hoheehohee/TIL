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
          title: Text('전시실 선택', style: TextStyle(fontWeight: FontWeight.bold)),
          leading: Builder(
            builder: (BuildContext context) => (
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {}
              )
            )
          )
        ),
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final List<String> _categoryList = ['전시 카테고리1', '전시 카테고리2', '전시 카테고리3', '전시 카테고리4', '전시 카테고리5'];
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _categoryList.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.white,
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black.withOpacity(0.3),
              indicatorColor: Colors.orange,
              tabs: _tabItems(context, _categoryList)
            )
          )
        ],
      )
    );
  }
  
  List<Widget> _tabItems(BuildContext context, List<String> _categoryList) {
    
    List<Widget> items = [];
    
    for(var i = 0; i < _categoryList.length; i++) {
      items.add(
        Center(child: Text(_categoryList[i], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
      );
    }
    
    return items;
  }
}
