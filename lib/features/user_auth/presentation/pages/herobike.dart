import 'package:flutter/material.dart';
class MyBike extends StatelessWidget {
  const MyBike({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Center(child: Image.network(
                  "https://tse3.mm.bing.net/th?id=OIP.8Os2AMK06gp8wy2cFqBAvAHaCb&pid=Api&P=0&h=180")),
              Image.network(
                "https://tse2.mm.bing.net/th?id=OIP.r53hrwTbRJl4sG9XHvIEbAHaEz&pid=Api&P=0&h=180",),
              Text("XPULSE 200 4V RALLY EDITION", style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),),
              SizedBox(height: 30,),
              Center(child: Text("SPECIFICATION", style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),),
              SizedBox(height: 30,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [buildContainer("https://tse4.mm.bing.net/th?id=OIP.APdszNxJHcvHOHLnss4l6wHaHa&pid=Api&P=0&h=180","DAKAR"),
                    SizedBox(width: 30,),
                    buildContainer("https://tse2.mm.bing.net/th?id=OIP.4a8lYoAsK8l7SCQPlw9eGQHaHa&pid=Api&P=0&h=180", "off-road"),
                    SizedBox(width: 30,),
                    buildContainer("https://tse4.mm.bing.net/th?id=OIP.APdszNxJHcvHOHLnss4l6wHaHa&pid=Api&P=0&h=180","DAKAR"),
                    SizedBox(width: 30,),
                    buildContainer("https://tse2.mm.bing.net/th?id=OIP.4a8lYoAsK8l7SCQPlw9eGQHaHa&pid=Api&P=0&h=180", "off-road"),
                    SizedBox(width: 30,),
                    buildContainer("https://tse4.mm.bing.net/th?id=OIP.APdszNxJHcvHOHLnss4l6wHaHa&pid=Api&P=0&h=180","DAKAR"),
                    SizedBox(width: 30,),
                    buildContainer("https://tse2.mm.bing.net/th?id=OIP.4a8lYoAsK8l7SCQPlw9eGQHaHa&pid=Api&P=0&h=180", "off-road"),
                  ],),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(img,content) {
    return Container(
      height: 120,
      width: 100,
      child: Column(
        children: [
          Image.network(img,
            height: 80,fit: BoxFit.cover,),
          SizedBox(height: 5,),
          Text(content),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
