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
          title: Text("신청상세정보"),
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
        body: Container(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
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
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3))
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: '3개월', 
                      // hint: Center(child: Text('국적 선택')),
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      onChanged: (newValue) {
                        print('$newValue');
                      },
                      items: <String>['3개월', '6개월', '1년']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(child: Text(value)),
                        );
                      }).toList(),
                    )
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3))
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: '전체 신청내역 조회', 
                      // hint: Center(child: Text('국적 선택')),
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      onChanged: (newValue) {
                        print('$newValue');
                      },
                      items: <String>['전체 신청내역 조회', '예약신청 내역', '신청승인 내역', '이용종료 내역', '신청취소 내역']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(child: Text(value)),
                        );
                      }).toList(),
                    )
                  )
                )
              )
            ]
          )
        ),
      ]
    );
  }
}
