import 'package:flutter/material.dart';
import '../Models/Globals.dart';

class Item2 extends StatefulWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  State<Item2> createState() => _Item2State();
}

class _Item2State extends State<Item2> {
  GlobalKey<FormState> priyanshi = GlobalKey<FormState>();

  TextEditingController item2nocontroller = TextEditingController(
      text: (Globals.item2No != null) ? Globals.item2No.toString() : null);
  TextEditingController item2namecontroller =
      TextEditingController(text: Globals.Item2Name);
  TextEditingController item2Qtycontroller = TextEditingController(
      text: (Globals.Item2Qty != null) ? Globals.Item2Qty.toString() : null);
  TextEditingController item2pricecontroller = TextEditingController(
      text:
          (Globals.Item2price != null) ? Globals.Item2price.toString() : null);

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
          "Second Itmes Details",
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
                    controller: item2nocontroller,
                    onSaved: (val) {
                      setState(() {
                        Globals.item2No = int.parse(val!);
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
                    controller: item2namecontroller,
                    onSaved: (val) {
                      setState(() {
                        Globals.Item2Name = val;
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
                    controller: item2Qtycontroller,
                    onSaved: (val) {
                      setState(() {
                        Globals.Item2Qty = int.parse(val!);
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
                    controller: item2pricecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Item Price";
                      }
                    },
                    onSaved: (val) {
                      setState(() {
                        Globals.Item2price = int.parse(val!);
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
                          )),
                      OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey.shade300)),
                        onPressed: () {
                          priyanshi.currentState!.reset();
                          setState(() {
                            item2nocontroller.clear();
                            item2namecontroller.clear();
                            item2Qtycontroller.clear();
                            item2pricecontroller.clear();

                            Globals.item2No = null;
                            Globals.Item2Name = null;
                            Globals.Item2Qty = null;
                            Globals.Item2price = null;
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
          Navigator.pushNamed(context, 'Item3');
        },
        backgroundColor: Colors.black54,
        child: const Icon(
          Icons.navigate_next_outlined,
          size: 50,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
