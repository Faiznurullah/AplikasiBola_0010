import 'package:flutter/material.dart';
import 'detail.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final numberController = TextEditingController();
  final nationController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  String genderController = "Pria";
  int? _selectedGender = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Pemain")),
      body: SafeArea(
        // saya menggunakan widget ini saran dari yutub untuk mengatasi masalah overflow ketika keyboard muncul
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: nameController,
                    decoration: InputDecoration(labelText: "Name"),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: positionController,
                    decoration: InputDecoration(labelText: "Position"),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: numberController,
                    decoration: InputDecoration(labelText: "Number"),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: ageController,
                    decoration: InputDecoration(labelText: "Age"),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: heightController,
                    decoration: InputDecoration(labelText: "Height"),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: nationController,
                    decoration: InputDecoration(labelText: "Nationality"),
                  ),

                   SizedBox(height: 10),

                  // Kata Gugel Pakai Radio Button
                  Text("Jenis Kelamin: ", textAlign: TextAlign.start),

                  Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      genderController = 'Pria';
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                                Text("Pria"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                       genderController = 'Wanita';
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                                Text("Wanita"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          DetailPage(name: nameController.text, position: positionController.text, number: int.parse(numberController.text), nation: nationController.text, age: int.parse(ageController.text), height: double.parse(heightController.text), gender: genderController)
                        ));
                      },
                      child: Text("Send Data"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
