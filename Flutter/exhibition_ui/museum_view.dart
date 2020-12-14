import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _imageUrl = "https://monthlyart.com/wp-content/uploads/2020/07/Kukje-Gallery-Wook-kyung-Choi-Untitled-c.-1960s-34-x-40-cm.jpg";
  final List<String> _items = ['전시 카테고리1', '전시 카테고리2', '전시 카테고리3', '전시 카테고리4', '전시 카테고리5', '전시 카테고리6', '전시 카테고리7'];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("코쟁이 박물관")
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: _mainWidget(),
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(width: 1.5, color: Colors.grey))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('자동전시 안내'),
                        IconButton(
                          icon: Icon(Icons.toggle_on_outlined),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('음성지원 안내'),
                        IconButton(
                          icon: Icon(Icons.toggle_on_outlined),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                )
              )
              
            ],
          ),
          drawer: _drawerWidget(),
          bottomNavigationBar: _bottomBar(),
        )
      )
    );
  }
  
  Widget _drawerWidget() => (
    Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[ 
          Column(
            children: [
              SizedBox(height: 30),
              ListTile(
                title: Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    )
  );
  
  Widget _mainWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: "작품명, 작가명을 입력하세요.",
            prefixIcon: Icon(Icons.search, color: Colors.grey,),
            focusedBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          )
        ),
        Container(
          height: 300,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_imageUrl),
              fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
//               padding: EdgeInsets.only(right: 10),
              icon: Icon(Icons.check_box_outline_blank),
              onPressed: () {},
            ),
            Text('상설전시', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          ],
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) => Items(_items[index])
          ),
        ),
      ],
    );
  }
  
  Widget _bottomBar() {
    return Container(
      color: Colors.white,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black54,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(
            icon: Icon(Icons.view_agenda),
            child: Text('메인', style: TextStyle(fontSize: 10))
          ),
          Tab(
            icon: Icon(Icons.map),
            child: Text('전시관 지도', style: TextStyle(fontSize: 10))
          ),
          Tab(
            icon: Icon(Icons.room),
            child: Text('오시는길', style: TextStyle(fontSize: 10))
          ),
        ]
      )
    );
  }
}

class Items extends StatelessWidget {
  Items(this.title);
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 3),
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title)
        )
      ),
      onTap: () {},
    );
  }
}
