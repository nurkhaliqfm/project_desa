import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_desa/subpages/persuratan/choose_letter.dart';
import 'package:project_desa/subpages/persuratan/letter_status.dart';

import '../bloc/main_navigation/main_navigation_bloc.dart';

class Letter extends StatelessWidget {
  const Letter({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<MainNavigationBloc>().add(HomeScreenEvent());
        return false;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Layanan Persuratan',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black26, width: 1.0)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Prosedur Pengajuan Surat:',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          '1. ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Flexible(
                          child: Text(
                            'Pilih jenis surat',
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          '2. ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Flexible(
                          child: Text(
                            'Lengkapi data & berkas yang dibutuhkan',
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          '3. ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Flexible(
                            child: Text(
                          'Cetak surat ( Bisa diambil di kantor desa atau Mencetak Softcopy)',
                          style: TextStyle(fontSize: 15),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    width: 200,
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black26, width: 1.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ChooseLetter(),
                          ),
                        );
                      },
                      child: const Text(
                        'AJUKAN SURAT',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black26, width: 1.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LetterStatus(),
                          ),
                        );
                      },
                      child: const Text(
                        'STATUS SURAT',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
