import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '언어 설정',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black26,
          leading: Builder(
            builder: (BuildContext context) => (
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 60,
          color: Colors.black12,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('中文'),
              IconButton(
                icon: Icon(Icons.radio_button_unchecked),
                onPressed: () {},
              )
            ],
          )
        ),
        Container(
          width: double.infinity,
          height: 60,
          color: Colors.black26,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('ENGLISH'),
              IconButton(
                icon: Icon(Icons.radio_button_unchecked),
                onPressed: () {},
              )
            ],
          )
        ),
        Container(
          width: double.infinity,
          height: 60,
          color: Colors.black12,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('日本語'),
              IconButton(
                icon: Icon(Icons.radio_button_unchecked),
                onPressed: () {},
              )
            ],
          )
        ),
        Container(
          width: double.infinity,
          height: 60,
          color: Colors.black26,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('한국어'),
              IconButton(
                icon: Icon(Icons.check_circle_outline, color: Colors.orange),
                onPressed: () {},
              )
            ],
          )
        )
      ],
    );
  }
}
