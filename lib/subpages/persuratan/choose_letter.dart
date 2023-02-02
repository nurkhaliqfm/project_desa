import 'package:flutter/material.dart';
import 'package:project_desa/subpages/persuratan/form_letter.dart';

class ChooseLetter extends StatefulWidget {
  const ChooseLetter({super.key});

  @override
  State<ChooseLetter> createState() => _ChooseLetterState();
}

class _ChooseLetterState extends State<ChooseLetter> {
  final List<Map<String, dynamic>> _listSurat = [
    {"id": 1, 'name': "Surat Domisili"},
    {"id": 2, 'name': "Surat Kematian"},
    {"id": 3, 'name': "Surat Keterangan Kurang Mampu"},
    {"id": 4, 'name': "Surat Ijin Usaha"},
    {"id": 5, 'name': "Surat Keterangan KTP Hilang"},
    {"id": 6, 'name': "Surat Pengurusan Akta Tanah"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Daftar Surat',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: _listSurat.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const FormLetter(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black26),
                        ),
                        child: Text(
                          _listSurat[index]['name'],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
