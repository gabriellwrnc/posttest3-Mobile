import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

enum Survive { laki, perempuan }

class _MainPageState extends State<MainPage> {
  final controllerNama = TextEditingController();
  final controllerAlamat = TextEditingController();
  final controllerGoldar = TextEditingController();
  String nama = "", alamat = "", goldar = "", gender = "", outputGender = "";
  bool submit = false;
  Survive? kelamin = Survive.laki;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/logo1.png",
              fit: BoxFit.contain,
              height: 28,
            ),
            Text(
              " AYO DONOR",
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
        backgroundColor: Color(0xffEF233C),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Masukkan data diri anda : ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: controllerNama,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: controllerAlamat,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Alamat",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: controllerGoldar,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Golongan Darah",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Jenis Kelamin : "),
              ),
              Row(
                children: [
                  Radio(
                      activeColor: Color(0xffEF233C),
                      value: Survive.laki,
                      groupValue: kelamin,
                      onChanged: (Survive? value) {
                        setState(() {
                          kelamin = value;
                        });
                        if (value == Survive.laki) {
                          gender = "Laki-laki";
                        }
                      }),
                  Text("Laki - laki"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      activeColor: Color(0xffEF233C),
                      value: Survive.perempuan,
                      groupValue: kelamin,
                      onChanged: (Survive? value) {
                        setState(() {
                          kelamin = value;
                          if (value == Survive.perempuan) {
                            gender = "Perempuan";
                          }
                        });
                      }),
                  Text("Perempuan"),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffEF233C),
                  ),
                  onPressed: (() {
                    setState(() {
                      nama = "Nama anda : " + controllerNama.value.text;
                      alamat =
                          "Alamat anda di : " + controllerAlamat.value.text;
                      goldar = "Golongan darah anda : " +
                          controllerGoldar.value.text;
                      outputGender = "Jenis Kelamin anda : " + gender;
                    });
                    submit = true;
                  }),
                  child: Text("Submit"),
                ),
              ),
              if (submit) ...[
                Text(
                  "Data diri anda : ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text("$nama"),
                Text("$alamat"),
                Text("$goldar"),
                Text("$outputGender"),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
