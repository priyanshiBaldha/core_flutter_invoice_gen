import 'package:flutter/material.dart';
import '../Models/Globals.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  GlobalKey<FormState> priyanshi = GlobalKey<FormState>();

  TextEditingController item1nocontroller = TextEditingController(
      text: (Globals.item1No != null) ? Globals.item1No.toString() : null);
  TextEditingController item1namecontroller =
      TextEditingController(text: Globals.Item1Name);
  TextEditingController item1Qtycontroller = TextEditingController(
      text: (Globals.Item1Qty != null) ? Globals.Item1Qty.toString() : null);
  TextEditingController item1pricecontroller = TextEditingController(
      text:
          (Globals.Item1price != null) ? Globals.Item1price.toString() : null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: const Text(
          "First Itmes Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
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
                    controller: item1nocontroller,
                    onSaved: (val) {
                      setState(() {
                        Globals.item1No = int.parse(val!);
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
                    controller: item1namecontroller,
                    onSaved: (val) {
                      setState(() {
                        Globals.Item1Name = val;
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
                    controller: item1Qtycontroller,
                    onSaved: (val) {
                      setState(() {
                        Globals.Item1Qty = int.parse(val!);
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
                    controller: item1pricecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Item Price";
                      }
                    },
                    onSaved: (val) {
                      setState(() {
                        Globals.Item1price = int.parse(val!);
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
                            item1nocontroller.clear();
                            item1namecontroller.clear();
                            item1Qtycontroller.clear();
                            item1pricecontroller.clear();

                            Globals.item1No = null;
                            Globals.Item1Name = null;
                            Globals.Item1Qty = null;
                            Globals.Item1price = null;
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
          Navigator.pushNamed(context, 'Item2');
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
