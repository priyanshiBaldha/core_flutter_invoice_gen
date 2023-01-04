import 'package:flutter/material.dart';
import '../Models/Globals.dart';

class Item3 extends StatefulWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  State<Item3> createState() => _Item3State();
}

class _Item3State extends State<Item3> {
  GlobalKey<FormState> priyanshi = GlobalKey<FormState>();

  TextEditingController item3nocontroller = TextEditingController(
      text: (Globals.item3No != null) ? Globals.item3No.toString() : null);
  TextEditingController item3namecontroller =
      TextEditingController(text: Globals.Item3Name);
  TextEditingController item3Qtycontroller = TextEditingController(
      text: (Globals.Item3Qty != null) ? Globals.Item3Qty.toString() : null);
  TextEditingController item3pricecontroller = TextEditingController(
      text:
          (Globals.Item3price != null) ? Globals.Item3price.toString() : null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_outlined)),
        title: const Text(
          "Itmes Details",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: priyanshi,
              child: Column(
                children: [
                  TextFormField(
                    controller: item3nocontroller,
                    onSaved: (val) {
                      setState(() {
                        Globals.item3No = int.parse(val!);
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Item No.";
                      }
                    },
                    decoration: const InputDecoration(
                      hoverColor: Colors.red,
                      enabled: true,
                      hintText: "Item No.",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: item3namecontroller,
                    onSaved: (val) {
                      setState(() {
                        Globals.Item3Name = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Item Name";
                      }
                    },
                    decoration: const InputDecoration(
                      hoverColor: Colors.red,
                      enabled: true,
                      hintText: "Item Name",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    controller: item3Qtycontroller,
                    onSaved: (val) {
                      setState(() {
                        Globals.Item3Qty = int.parse(val!);
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Item Qty";
                      }
                    },
                    decoration: const InputDecoration(
                      hoverColor: Colors.red,
                      enabled: true,
                      hintText: "Item Qty",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    controller: item3pricecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Item Price";
                      }
                    },
                    onSaved: (val) {
                      setState(() {
                        Globals.Item3price = int.parse(val!);
                      });
                    },
                    decoration: const InputDecoration(
                      hoverColor: Colors.red,
                      enabled: true,
                      hintText: "Item Price",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey.shade300)),
                        onPressed: (() {
                          if (priyanshi.currentState!.validate()) {
                            priyanshi.currentState!.save();
                          }
                        }),
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey.shade300)),
                        onPressed: () {
                          priyanshi.currentState!.reset();
                          setState(() {
                            item3nocontroller.clear();
                            item3namecontroller.clear();
                            item3Qtycontroller.clear();
                            item3pricecontroller.clear();

                            Globals.item3No = null;
                            Globals.Item3Name = null;
                            Globals.Item3Qty = null;
                            Globals.Item3price = null;
                          });
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pdf');
        },
        backgroundColor: Colors.black54,
        child: const Icon(
          Icons.picture_as_pdf_outlined,
          size: 35,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
