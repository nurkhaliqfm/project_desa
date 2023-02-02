import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

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
      'date': '11 Januari 2023',
      'msg':
          'Mohon maaf pengajuan anda belum bisa diproses karena berkas KTP yang anda upload tidak terdaftar.'
    },
    {
      "id": 2,
      'name': "Surat Kematian",
      'id_status': 'success',
      'status': 'Selesai',
      'date': '11 Januari 2023',
      'msg':
          'Surat anda telah selesai dibuat, silahkan dipergunakan secara bijak. Surat telah di lengkapi barcode sebagai bentuk sah surat dari desa.'
    },
    {
      "id": 3,
      'name': "Surat Ijin Usaha",
      'id_status': 'pending',
      'status': 'Verifikasi',
      'date': '11 Januari 2023',
      'msg':
          'Surat anda masih dalam tahap pengecekan berkas dan penyetujuan dari kepala desa / sekertaris desa. Mohon bersabar dan mengecek kembali beberapa waktu kedepan.'
    },
    {
      "id": 4,
      'name': "Surat Keterangan Kurang Mampu 2023",
      'id_status': 'pending',
      'status': 'Verifikasi',
      'date': '11 Januari 2023',
      'msg':
          'Surat anda masih dalam tahap pengecekan berkas dan penyetujuan dari kepala desa / sekertaris desa. Mohon bersabar dan mengecek kembali beberapa waktu kedepan.'
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: Colors.black26)),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Ionicons.arrow_back,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Status Persuratan',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 40,
                    width: 40,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
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
                              SizedBox(
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
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                if (_listStatusSurat[index]['id_status'] ==
                                    'success') {
                                  return AlertDialog(
                                    content: Text(
                                      _listStatusSurat[index]['msg'],
                                      textAlign: TextAlign.center,
                                    ),
                                    actionsAlignment: MainAxisAlignment.center,
                                    actions: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: const [
                                            Icon(
                                              Ionicons.download_outline,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Download Surat',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (_listStatusSurat[index]
                                        ['id_status'] ==
                                    'pending') {
                                  return AlertDialog(
                                    content: Text(
                                      _listStatusSurat[index]['msg'],
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                                return AlertDialog(
                                  content: Text(
                                    _listStatusSurat[index]['msg'],
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              },
                            ),
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
