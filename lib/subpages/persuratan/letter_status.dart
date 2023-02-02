import 'package:flutter/material.dart';

class LetterStatus extends StatefulWidget {
  const LetterStatus({super.key});

  @override
  State<LetterStatus> createState() => _LetterStatusState();
}

class _LetterStatusState extends State<LetterStatus> {
  final List<Map<String, dynamic>> _listStatusSurat = [
    {
      "id": 1,
      'name': "Surat Domisili",
      'id_status': 'failed',
      'status': 'Gagal',
      'date': '11 Januari 2023'
    },
    {
      "id": 2,
      'name': "Surat Kematian",
      'id_status': 'success',
      'status': 'Selesai',
      'date': '11 Januari 2023'
    },
    {
      "id": 3,
      'name': "Surat Ijin Usaha",
      'id_status': 'pending',
      'status': 'Verifikasi',
      'date': '11 Januari 2023'
    },
    {
      "id": 4,
      'name': "Surat Keterangan Kurang Mampu 2023",
      'id_status': 'pending',
      'status': 'Verifikasi',
      'date': '11 Januari 2023'
    },
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
                  itemCount: _listStatusSurat.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black26)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_listStatusSurat[index]['id_status'] ==
                                  'failed') ...[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    _listStatusSurat[index]['status'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ] else if (_listStatusSurat[index]['id_status'] ==
                                  'success') ...[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    _listStatusSurat[index]['status'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ] else ...[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade100,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    _listStatusSurat[index]['status'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                              Container(
                                width: 200,
                                child: Text(
                                  _listStatusSurat[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                _listStatusSurat[index]['date'],
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: Container(
                              width: 56,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black26),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Detail',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
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
