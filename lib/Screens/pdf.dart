import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:invoice_second/Models/Globals.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class pdf extends StatefulWidget {
  const pdf({Key? key}) : super(key: key);

  @override
  State<pdf> createState() => _pdfState();
}

class _pdfState extends State<pdf> {
    final pdf = pw.Document();

    @override
    void initState() {
      super.initState();
      makepdf();
    }

  makepdf() {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context1) => pw.Container(
          padding: const pw.EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: PdfColors.white,
          child: pw.Padding(
            padding: const pw.EdgeInsets.all(10.0),
            child: pw.Column(
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(
                          height: 80,
                        ),
                        pw.Text(
                          "${Globals.firstname} ${Globals.lastname}",
                          style: const pw.TextStyle(color: PdfColors.black),
                        ),
                        pw.Text(
                          "${Globals.address}",
                          style: const pw.TextStyle(color: PdfColors.black),
                        ),
                        pw.Text(
                          "${Globals.email}",
                          style: const pw.TextStyle(color: PdfColors.black),
                        ),
                        pw.Text(
                          "${Globals.contact}",
                          style: const pw.TextStyle(color: PdfColors.black),
                        ),
                      ],
                    ),
                    //SizedBox(width: 150,),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          "INVOICE",
                          style: pw.TextStyle(
                              color: PdfColors.indigo,
                              fontSize: 30,
                              letterSpacing: 3,
                              fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          "Contact Us",
                          style: const pw.TextStyle(color: PdfColors.grey),
                        ),
                        pw.Text(
                          "Mo:9512057000",
                          style: const pw.TextStyle(color: PdfColors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Divider(
                  thickness: 3,
                  color: PdfColors.black,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Column(
                      children: [
                        pw.Text(
                          "Item No",
                          style: const pw.TextStyle(color: PdfColors.indigo),
                        ),
                        pw.Divider(
                          thickness: 3,
                          color: PdfColors.black,
                        ),
                        pw.Text("${Globals.item1No}"),
                        pw.Text("${Globals.item2No}"),
                        pw.Text("${Globals.item3No}"),
                      ],
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Column(
                      children: [
                        pw.Text(
                          "Item Name",
                          style: const pw.TextStyle(color: PdfColors.indigo),
                        ),
                        pw.Divider(
                          thickness: 3,
                          color: PdfColors.black,
                        ),
                        pw.Text("${Globals.Item1Name}"),
                        pw.Text("${Globals.Item2Name}"),
                        pw.Text("${Globals.Item3Name}"),
                      ],
                    ),
                    pw.Column(
                      children: [
                        pw.Text(
                          "Item Qty",
                          style: const pw.TextStyle(color: PdfColors.indigo),
                        ),
                        pw.Divider(
                          thickness: 3,
                          color: PdfColors.black,
                        ),
                        pw.Text("${Globals.Item1Qty}"),
                        pw.Text("${Globals.Item2Qty}"),
                        pw.Text("${Globals.Item3Qty}"),
                      ],
                    ),
                    pw.Column(
                      children: [
                        pw.Text(
                          "Item Price",
                          style: const pw.TextStyle(color: PdfColors.indigo),
                        ),
                        pw.Divider(
                          thickness: 3,
                          color: PdfColors.black,
                        ),
                        pw.Text("${Globals.Item1price}"),
                        pw.Text("${Globals.Item2price}"),
                        pw.Text("${Globals.Item3price}"),
                      ],
                    ),
                    pw.Column(
                      children: [
                        pw.Text(
                          "Total Price",
                          style: const pw.TextStyle(color: PdfColors.indigo),
                        ),
                        pw.Divider(
                          thickness: 3,
                          color: PdfColors.black,
                        ),
                        pw.Text("${Globals.Total1price}"),
                        pw.Text("${Globals.Total2price}"),
                        pw.Text("${Globals.Total3price}"),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 280,
                ),
                pw.Divider(
                  thickness: 3,
                  color: PdfColors.black,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(right: 20.0),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        children: [
                          pw.Text(
                              "Sub Total : ${Globals.subTotal = Globals.Total1price! + Globals.Total2price! + Globals.Total3price!}"),
                          pw.Text("Tax : ${Globals.tax = Globals.subTotal! * 0.18}"),
                          pw.Text(
                            "Total : ${Globals.subTotal! + Globals.tax!}",
                            style:  pw.TextStyle(
                                color: PdfColors.redAccent,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Thank You For Visiting....",
                      style: pw.TextStyle(
                          fontSize: 25, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.picture_as_pdf),
          onPressed: () async {
            Uint8List data = await pdf.save();
            await Printing.layoutPdf(onLayout: (format) => data);
          },
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      "${Globals.firstname} ${Globals.lastname}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      "${Globals.address}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      "${Globals.email}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      "${Globals.contact}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                //SizedBox(width: 150,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "INVOICE",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 30,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Contact Us",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Mo:9512057000",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 3,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      "Item No",
                      style: TextStyle(
                          color: Colors.indigo, fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                    Text(
                      "${Globals.item1No}",
                    ),
                    Text("${Globals.item2No}"),
                    Text("${Globals.item3No}"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    const Text(
                      "Item Name",
                      style: TextStyle(
                          color: Colors.indigo, fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                    Text("${Globals.Item1Name}"),
                    Text("${Globals.Item2Name}"),
                    Text("${Globals.Item3Name}"),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Item Qty",
                      style: TextStyle(
                          color: Colors.indigo, fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                    Text("${Globals.Item1Qty}"),
                    Text("${Globals.Item2Qty}"),
                    Text("${Globals.Item3Qty}"),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Item Price",
                      style: TextStyle(
                          color: Colors.indigo, fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                    Text("${Globals.Item1price}"),
                    Text("${Globals.Item2price}"),
                    Text("${Globals.Item3price}"),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Total Price",
                      style: TextStyle(
                          color: Colors.indigo, fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                    Text(
                        "${Globals.Total1price = Globals.Item1price! * Globals.Item1Qty!}"),
                    Text(
                        "${Globals.Total2price = Globals.Item2price! * Globals.Item2Qty!}"),
                    Text(
                        "${Globals.Total3price = Globals.Item3price! * Globals.Item3Qty!}"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 280,
            ),
            const Divider(
              thickness: 3,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "Sub Total : ${Globals.subTotal = Globals.Total1price! + Globals.Total2price! + Globals.Total3price!}"),
                      Text("Tax : ${Globals.tax = Globals.subTotal! * 0.18}"),
                      Text(
                        "Total : ${Globals.subTotal! + Globals.tax!}",
                        style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Thank You For Visiting....",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
