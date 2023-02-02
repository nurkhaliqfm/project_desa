import 'package:flutter/material.dart';

import '../../main_navigation.dart';

class PenggunaanAnggaran extends StatefulWidget {
  const PenggunaanAnggaran({super.key});

  @override
  State<PenggunaanAnggaran> createState() => _PenggunaanAnggaranState();
}

class _PenggunaanAnggaranState extends State<PenggunaanAnggaran> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Penggunaan Anggaran"),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MainNavigation(),
                    ),
                  );
                },
                child: const Text('Back to Home'))
          ],
        ),
      ),
    );
  }
}
