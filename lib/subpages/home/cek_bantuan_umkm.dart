import 'package:flutter/material.dart';

class CekBantuanUmkm extends StatefulWidget {
  const CekBantuanUmkm({super.key});

  @override
  State<CekBantuanUmkm> createState() => _CekBantuanUmkmState();
}

class _CekBantuanUmkmState extends State<CekBantuanUmkm> {
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
                      'Cek Bantuan UMKM',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Masukkan NIK Pemilik Usaha',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                onChanged: (value) => print(value),
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
                        onPressed: () {},
                        child: const Text(
                          'Cari Data',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
