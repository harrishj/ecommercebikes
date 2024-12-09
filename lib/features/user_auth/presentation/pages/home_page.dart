import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_authentication/features/user_auth/presentation/pages/herobike.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'FavoritesScreen.dart';
import 'firebase_options.dart';
import 'orderScreen.dart';
import 'profileScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Our First App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const FavoritesScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "BIKERS WORLD",
            style: TextStyle(
                fontFamily: 'FontMain', fontSize: 25, color: Colors.white),
          )),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              CarouselSlider(
                items: [
                  buildcarosal(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAui_vXVMvCKz49exgRHQJlwy9X1AM1X53fQ&s"),
                  buildcarosal(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoYl0zR4xb5FGPJfUuy5clrT42yNbjf0RDkg&s"),
                  buildcarosal(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhOMzoEP7I5ojvybb6sGLBRaIPGhlVSq66LQ&s"),
                  buildcarosal(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbrn883od3A0M2ffhpXeaalnXidWL53pfzQA&s")
                ],
                options: CarouselOptions(
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    viewportFraction: 0.85),
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            print("exhaust");
                          },
                          child: buildContainer(
                              "https://tse2.mm.bing.net/th?id=OIP.dFsd5B1ICCEQ8_drjRm2JAHaHa&pid=Api&P=0&h=180",
                              "EXHAUST"));
                    }),
                    SizedBox(
                      width: 30,
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            print("helmet");
                          },
                          child: buildContainer(
                              "https://tse1.mm.bing.net/th?id=OIP.BROLAq2GRI_X5rMZQadh1wHaFQ&pid=Api&P=0&h=180",
                              "HELMET"));
                    }),
                    SizedBox(
                      width: 30,
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            print("battery");
                          },
                          child: buildContainer(
                              "https://tse2.mm.bing.net/th?id=OIP.-qn3xR_K27cEpo1xHE1rnwHaHa&pid=Api&P=0&h=180",
                              "BATTERY"));
                    }),
                    SizedBox(
                      width: 30,
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            print("jacket");
                          },
                          child: buildContainer(
                              "https://tse2.mm.bing.net/th?id=OIP.Hcsv8jIPnRgRNCBBNLPF8gHaH0&pid=Api&P=0&h=180",
                              "JACKET"));
                    }),
                    SizedBox(
                      width: 30,
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            print("oil");
                          },
                          child: buildContainer(
                              "https://tse2.mm.bing.net/th?id=OIP.5ix5atg9njLc03sKK4h5iQHaH0&pid=Api&P=0&h=180",
                              "OIL"));
                    }),
                    SizedBox(
                      width: 30,
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            print("chain");
                          },
                          child: buildContainer(
                              "https://tse3.mm.bing.net/th?id=OIP.is81QR42asay_8HXuJxViwHaHa&pid=Api&P=0&h=180",
                              "CHAIN"));
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "select your brand",
                style: TextStyle(
                    fontFamily: 'FontMain', color: Colors.black, fontSize: 25),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyBike()));
                            print("hero");
                          },
                          child: buildCompany(
                              "https://tse1.mm.bing.net/th?id=OIP.HMlmc0eFYp_G0FQSiD0XWwHaE8&pid=Api&P=0&h=180")),
                      GestureDetector(
                          onTap: () {
                            print("yamaha");
                          },
                          child: buildCompany(
                              "https://tse1.mm.bing.net/th?id=OIP.84kImLAGIx8tBGkIgWDdPgHaHa&pid=Api&P=0&w=300&h=300")),
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            print("honda");
                          },
                          child: buildCompany(
                              "https://tse1.mm.bing.net/th?id=OIP.B1oQaoSKl5mbTPDoWB20nQHaHa&pid=Api&P=0&h=180")),
                      GestureDetector(
                          onTap: () {
                            print("suzuki");
                          },
                          child: buildCompany(
                              "https://tse3.mm.bing.net/th?id=OIP._3Ab214NI-x7O-KFOqU5mgHaHa&pid=Api&P=0&h=180")),
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            print("bajaj");
                          },
                          child: buildCompany(
                              "https://tse2.mm.bing.net/th?id=OIP.xvkJCFyDE--5MBwboUjyXgHaE0&pid=Api&P=0&h=180")),
                      GestureDetector(
                          onTap: () {
                            print("royal enfield");
                          },
                          child: buildCompany(
                              "https://tse3.mm.bing.net/th?id=OIP.jIqvIBUd15CmNEsmMtfnfQHaJ4&pid=Api&P=0&h=180")),
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Builder(builder: (context) {
                        return GestureDetector(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                              print("tvs");
                            },
                            child: buildCompany(
                                "https://tse1.mm.bing.net/th?id=OIP.i5sIUXAGNyFSgQ8dDvf5nAHaEK&pid=Api&P=0&h=180"));
                      }),
                      Builder(builder: (context) {
                        return InkWell(
                            onTap: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                            },
                            child: buildCompany(
                                "https://tse4.mm.bing.net/th?id=OIP.D2vtTizvp2hYx6_l6V5zAAHaEK&pid=Api&P=0&h=180"));
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }

  Container buildcarosal(imgg) {
    return Container(
      height: 200,
      width: 370,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imgg),
            fit: BoxFit.cover,
          )),
    );
  }

  Container buildCompany(img) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(.5, 6.5), blurRadius: 6.0)
          ]),
    );
  }
}

Container buildContainer(img, content) {
  return Container(
    height: 120,
    width: 100,
    child: Column(
      children: [
        Image.network(
          img,
          height: 80,
        ),
        SizedBox(
          height: 5,
        ),
        Text(content),
      ],
    ),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10)),
  );
}
