import 'package:flutter/material.dart';
import 'Screens/Customer.dart';
import 'Screens/Item2.dart';
import 'Screens/Item3.dart';
import 'Screens/Items.dart';
import 'Screens/Splash.dart';
import 'Screens/pdf.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => const Splash(),
        'HomePage': (context) => const HomePage(),
       'Customer' : (context) =>const Customer(),
        'Items'   : (context) => const Items(),
        'Item2': (context)=>const Item2(),
        'Item3':(context)=>const Item3(),
        'pdf':(context)=>const pdf(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "INVOICE GENERATOR",
          style: TextStyle(color: Colors.black, letterSpacing: 2),
        ),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 140,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/invoice.png"),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: (){
                  setState(() {
                    Navigator.pushNamed(context, 'Customer');
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black,width: 3)
                    ),
                    child: const Text("Create New Invoice",style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xffF1F7E7),
    );
  }
}