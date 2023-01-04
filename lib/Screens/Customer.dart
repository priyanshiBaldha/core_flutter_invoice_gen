import 'package:flutter/material.dart';
import 'package:invoice_second/Models/Globals.dart';

class Customer extends StatefulWidget {
  const Customer({Key? key}) : super(key: key);

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  GlobalKey<FormState> priyanshi = GlobalKey<FormState>();

  TextEditingController fnamecontroller =
      TextEditingController(text: Globals.firstname);
  TextEditingController lnamecontroller =
      TextEditingController(text: Globals.lastname);
  TextEditingController contactcontroller = TextEditingController(
      text: (Globals.contact != null) ? Globals.contact.toString() : null);
  TextEditingController emailcontroller =
      TextEditingController(text: Globals.email);
  TextEditingController addresscontroller =
      TextEditingController(text: Globals.address);

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
          "Customer Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      controller: fnamecontroller,
                      onSaved: (val) {
                        setState(() {
                          Globals.firstname = val;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Name";
                        }
                      },
                      decoration: const InputDecoration(
                        hoverColor: Colors.red,
                        enabled: true,
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: lnamecontroller,
                      onSaved: (val) {
                        setState(() {
                          Globals.lastname = val;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Name";
                        }
                      },
                      decoration: const InputDecoration(
                        hoverColor: Colors.red,
                        enabled: true,
                        hintText: "Last Name",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: contactcontroller,
                      validator: (val) {
                        if (val!.length == 10) {
                          return null;
                        } else if (val.isEmpty) {
                          return "Enter Number";
                        } else {
                          return "Entered Value Is Invalid";
                        }
                      },
                      onSaved: (val) {
                        setState(() {
                          Globals.contact = int.parse(val!);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hoverColor: Colors.red,
                        hintText: "Phone",
                        prefixStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Email Id....";
                        }
                      },
                      onSaved: (val) {
                        setState(() {
                          Globals.email = val;
                        });
                      },
                      decoration: const InputDecoration(
                        hoverColor: Colors.red,
                        enabled: true,
                        suffixText: "@gmail.com",
                        suffixStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: addresscontroller,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Address";
                        }
                      },
                      onSaved: (val) {
                        setState(() {
                          Globals.address = val;
                        });
                      },
                      maxLines: 2,
                      decoration: const InputDecoration(
                        hoverColor: Colors.red,
                        enabled: true,
                        hintText: "Address",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
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
                                (states) => Colors.grey.shade300,
                              ),
                            ),
                            onPressed: (() {
                              if (priyanshi.currentState!.validate()) {
                                priyanshi.currentState!.save();
                              }
                            }),
                            child: const Text(
                              "Submit",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            )),
                        OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey.shade300,
                            ),
                          ),
                          onPressed: () {
                            priyanshi.currentState!.reset();
                            setState(() {
                              fnamecontroller.clear();
                              lnamecontroller.clear();
                              emailcontroller.clear();
                              contactcontroller.clear();
                              addresscontroller.clear();
                              Globals.firstname = null;
                              Globals.lastname = null;
                              Globals.contact = null;
                              Globals.email = null;
                              Globals.address = null;
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Items');
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