import 'package:firebase_authentication/features/app/splash_screen/splash_screen.dart';
import 'package:firebase_authentication/features/user_auth/presentation/pages/herobike.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart'; // For date formatting


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const HomePage());
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
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _diseaseController = TextEditingController();
//   DateTime? _selectedDate; // For holding selected appointment date
//   final CollectionReference _patientsCollection =
//   FirebaseFirestore.instance.collection('patients');
//
//   // Function to select date
//   Future<void> _pickDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }
//
//   // Create or update function
//   Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
//     String action = 'create';
//     if (documentSnapshot != null) {
//       action = 'update';
//       _nameController.text = documentSnapshot['name'];
//       _diseaseController.text = documentSnapshot['disease'];
//       _selectedDate = (documentSnapshot['appoint'] as Timestamp).toDate();
//     }
//
//     await showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext ctx) {
//           return Padding(
//             padding: EdgeInsets.only(
//               top: 20,
//               left: 20,
//               right: 20,
//               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   controller: _diseaseController,
//                   decoration: const InputDecoration(labelText: 'Disease'),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   _selectedDate == null
//                       ? 'No Date Chosen!'
//                       : 'Appointment Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _pickDate(context),
//                   child: const Text('Select Appointment Date'),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   child: Text(action == 'create' ? 'Create' : 'Update'),
//                   onPressed: () async {
//                     final String? name = _nameController.text;
//                     final String? disease = _diseaseController.text;
//                     if (name != null && disease != null && _selectedDate != null) {
//                       if (action == 'create') {
//                         await _patientsCollection.add({
//                           "name": name,
//                           "disease": disease,
//                           "appoint": _selectedDate,
//                         });
//                         // } else if (action == 'update') {
//                         //   await _patientsCollection
//                         //       .doc(documentSnapshot!.id)
//                         //       .update({
//                         //     "name": name,
//                         //     "disease": disease,
//                         //     "appoint": _selectedDate,
//                         //   });
//                       }
//                       _nameController.clear();
//                       _diseaseController.clear();
//                       setState(() {
//                         _selectedDate = null;
//                       });
//                       Navigator.of(context).pop();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My First App'),
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//             image: DecorationImage(image: NetworkImage("https://media0.giphy.com/media/dv78V39sfMssrjpHWO/giphy.webp?cid=790b76115m1r0ny7k4lu4y5vh3tqzcaub5l42vbeu5tsszej&ep=v1_gifs_search&rid=giphy.webp&ct=g"),
//             )
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: StreamBuilder(
//             stream: _patientsCollection.snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//               if (streamSnapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: streamSnapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final DocumentSnapshot documentSnapshot =
//                     streamSnapshot.data!.docs[index];
//                     return Card(
//
//                       margin: const EdgeInsets.all(10),
//                       child: ListTile(
//                         title: Text(documentSnapshot['name']),
//                         subtitle: Text(
//                           "${documentSnapshot['disease']} - ${DateFormat.yMMMd().format((documentSnapshot['appoint'] as Timestamp).toDate())}",
//                         ),
//                         trailing: SizedBox(
//                           width:70,
//                           child: Row(
//                             children: [
//                               //IconButton(
//                               //icon: const
//                               Icon(Icons.edit),
//                               // onPressed: () => _createOrUpdate(documentSnapshot),
//                               //),
//                               SizedBox(width: 20,),
//                               // IconButton(
//                               //icon: const
//                               Icon(Icons.delete),
//                               //   onPressed: () => _deleteProduct(documentSnapshot.id),
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _createOrUpdate(),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("BIKERS WORLD",style: TextStyle(fontFamily: 'FontMain',fontSize: 25,color: Colors.white),)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),),
        body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CarouselSlider(items:[
                buildcarosal("https://tse4.mm.bing.net/th?id=OIP.N7f7sYZNf3gckB124-H8kgHaE7&pid=Api&P=0&h=180"),
                buildcarosal("https://tse4.mm.bing.net/th?id=OIP.fk3HkgN1w9NCyxeWQVfIBwHaE7&pid=Api&P=0&h=180"),
                buildcarosal("https://tse2.mm.bing.net/th?id=OIP.dqgiVmesrwF0a5IUutU5DgHaEJ&pid=Api&P=0&h=180"),
                buildcarosal("https://tse3.mm.bing.net/th?id=OIP.G5eklx5vh0Q6MdI14WxQywHaD4&pid=Api&P=0&h=180")
              ], options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 0.8,
              )
              ),
              SizedBox(height: 25,),
              Text("select your brand",style: TextStyle(fontFamily: 'FontMain',color:Colors.black,fontSize: 25),),
              SizedBox(height: 25,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBike()));
                        print("hero");
                      },
                          child: buildCompany("https://tse1.mm.bing.net/th?id=OIP.HMlmc0eFYp_G0FQSiD0XWwHaE8&pid=Api&P=0&h=180")),
                      GestureDetector(onTap: (){
                        print("yamaha");
                      },
                          child: buildCompany("https://tse1.mm.bing.net/th?id=OIP.84kImLAGIx8tBGkIgWDdPgHaHa&pid=Api&P=0&w=300&h=300")),
                    ],
                  ),
                  SizedBox(height: 55,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(onTap: (){
                        print("honda");
                      },
                          child: buildCompany("https://tse1.mm.bing.net/th?id=OIP.B1oQaoSKl5mbTPDoWB20nQHaHa&pid=Api&P=0&h=180")),
                      GestureDetector(onTap: (){
                        print("suzuki");
                      },
                          child: buildCompany("https://tse3.mm.bing.net/th?id=OIP._3Ab214NI-x7O-KFOqU5mgHaHa&pid=Api&P=0&h=180")),
                    ],
                  ),
                  SizedBox(height: 55,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(onTap: (){
                        print("bajaj");
                      },
                          child: buildCompany("https://tse2.mm.bing.net/th?id=OIP.xvkJCFyDE--5MBwboUjyXgHaE0&pid=Api&P=0&h=180")),
                      GestureDetector(onTap: (){
                        print("royal enfield");
                      },
                          child: buildCompany("https://tse3.mm.bing.net/th?id=OIP.jIqvIBUd15CmNEsmMtfnfQHaJ4&pid=Api&P=0&h=180")),
                    ],
                  ),
                  SizedBox(height: 55,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Builder(
                          builder: (context) {
                            return GestureDetector(onTap: (){
                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                              print("tvs");
                            },
                                child: buildCompany("https://tse1.mm.bing.net/th?id=OIP.i5sIUXAGNyFSgQ8dDvf5nAHaEK&pid=Api&P=0&h=180"));
                          }
                      ),
                      Builder(
                          builder: (context) {
                            return InkWell(onTap: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                            },
                                child: buildCompany("https://tse4.mm.bing.net/th?id=OIP.D2vtTizvp2hYx6_l6V5zAAHaEK&pid=Api&P=0&h=180"));
                          }
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildcarosal(imgg) {
    return Container(
      height: 200,
      width: 370,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgg),
            fit: BoxFit.cover,
          )
      ),
    );
  }

  Container buildCompany(img) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(img),
              fit: BoxFit.cover
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(.5,6.5),
                blurRadius: 6.0
            )
          ]
      ),
    );
  }
}
