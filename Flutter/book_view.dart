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
        primarySwatch: Colors.grey,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          )
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("이용예약 신청"),
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
          child: MainView(),
        ),
      ),
    );
  }
}

class MainView extends StatelessWidget {
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
                child: Icon(Icons.event_note, color: Colors.orange)
              ),
              Expanded(
                flex: 1,
                child: Text('예약정보 입력', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              )
            ]
          )
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text('이용날짜 선택', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "이용할 날짜를 선택하세요",
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 5),
                child: Text('이용할 시간', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "이용할 시간를 선택하세요",
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 5),
                child: Text('외국인 구분', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.white,
                          child: IconButton(
                            splashRadius: 20,
                            icon: Icon(Icons.radio_button_on, color: Colors.orange),
                            onPressed: () {},
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('내국인')
                        )
                      ]
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.white,
                          child: IconButton(
                            splashRadius: 20,
                            icon: Icon(Icons.radio_button_on, color: Colors.orange),
                            onPressed: () {},
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('내국인')
                        )
                      ]
                    )
                  )
                ]
              )
            ]
          ),
        )
      ]
    );
  }
}
