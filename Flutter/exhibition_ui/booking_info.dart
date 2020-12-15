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
  var tabIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
              child:  SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: tabIndex == 0 
                ?  Container(
                  color: Colors.green
                )
                :  BookingInfo()
              )
            )
           
          ]
        )
      )
    );
  }
}

class BookingInfo extends StatelessWidget {
  
  final List<String> _menuItems = ['전체 신청내역 조회', '예약신청 내역', '신청승인 내역', '이용종료 내역', '신청취소 내역', '고객센터'];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined),
                          SizedBox(height: 10),
                          Text('예약신청 중')
                        ]
                      )
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.3)),
                          right: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.3))
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined),
                          SizedBox(height: 10),
                          Text('예약중 1')
                        ]
                      )
                    )
                  )
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.image_outlined),
                          SizedBox(height: 10),
                          Text('이용종료 10')
                        ]
                      )
                    )
                  )
                ),
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.3)),
              )
            ),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('진행중인 내역', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('(최근 3개월)', style: TextStyle(fontSize: 16, color: Colors.grey))
                    ]
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text('OOO\n신청', textAlign: TextAlign.center),
                          Text('0', style: TextStyle(color: Colors.orange))
                        ]
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text('신청\n확인', textAlign: TextAlign.center),
                          Text('0', style: TextStyle(color: Colors.orange))
                        ]
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text('OOO\n진행', textAlign: TextAlign.center),
                          Text('0', style: TextStyle(color: Colors.orange))
                        ]
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text('OOO\n??', textAlign: TextAlign.center),
                          Text('0', style: TextStyle(color: Colors.orange))
                        ]
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text('OOO\n종료', textAlign: TextAlign.center),
                          Text('0', style: TextStyle(color: Colors.orange))
                        ]
                      ),
                    ]
                  )
                ]
              )
            )
          ),
          Container(
            height: 320,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.3))),
            ),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 18),
              itemCount: _menuItems.length,
              itemBuilder: (BuildContext context, int index) => (
                Material(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_menuItems[index], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Icon(Icons.arrow_forward_ios)
                        ]
                      )
                    ) 
                  )
                )
              )
            )
          )
        ],
      )
    );
  }
}
