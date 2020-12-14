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
                icon: Icon(Icons.close_outlined),
                onPressed: () {}
              )
            )
          )
        ),
        body: Container(
          color: Colors.white,
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
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1.5, color: Colors.grey.withOpacity(0.3)))
            ),
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black.withOpacity(0.3),
              indicatorColor: Colors.orange,
              tabs: _tabItems(context, _categoryList)
            )
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Center(child: Text('F4', style: TextStyle(color: Colors.white, fontSize: 18)))
                ),
                Text('전시 카테고리1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: _exhibitItem()
          ),
          
        ],
      )
    );
  }
  
  List<Widget> _tabItems(BuildContext context, List<String> _categoryList) {
    
    List<Widget> items = [];
    
    for(var i = 0; i < _categoryList.length; i++) {
      items.add(
        Center(child: Text(_categoryList[i], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)))
      );
    }
    
    return items;
  }
  
  Widget _exhibitItem() {
    final List<String> _exhibitList = ['등록전시물1', '등록전시물2', '등록전시물3', '등록전시물4', '등록전시물5', '등록전시물1', '등록전시물2', '등록전시물3', '등록전시물4', '등록전시물1', '등록전시물2', '등록전시물3', '등록전시물4', '등록전시물5', '등록전시물1'];
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 18),
      itemCount: _exhibitList.length,
      itemBuilder: (BuildContext context, int index) => (
        Material( 
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 60, right: 20),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child:  Align(
                alignment: Alignment.centerLeft,
                child: Text(_exhibitList[index], style: TextStyle(fontSize: 16))
              )
            )
          )
        )
      ),
    );
  }
}
