import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../bloc/main_navigation/main_navigation_bloc.dart';
import '../subpages/home/cek_bansos.dart';
import '../subpages/home/cek_bantuan_umkm.dart';
import '../subpages/home/cek_dpt.dart';
import '../subpages/home/kemajuan_desa.dart';
import '../subpages/home/no_tlp_penting.dart';
import '../subpages/home/penggunaan_anggaran.dart';
import '../subpages/home/profil_desa.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Map<String, dynamic>> _listItemButton = [
    {"title": "Profil\n", 'icon': Ionicons.laptop_outline},
    {"title": "Layanan\nDesa", 'icon': Ionicons.document_text_outline},
    {"title": "Kemajuan\nDesa", 'icon': Ionicons.stats_chart_outline},
    {"title": "No. Tlp\nPenting", 'icon': Ionicons.phone_portrait_outline},
    {"title": "Penggunaan\nAnggaran", 'icon': Ionicons.cash_outline},
    {"title": "Cek DPT\n", 'icon': Ionicons.people_circle_outline},
    {"title": "Cek Bansos\n", 'icon': Ionicons.wallet_outline},
    {"title": "Cek Bantuan\nUMKM", 'icon': Ionicons.wallet_outline},
  ];

  @override
  Widget build(BuildContext context) {
    final List<TextButton> myHomeButtonList = List.generate(
      8,
      (index) {
        return TextButton(
          onPressed: () {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ProfilDesa(),
                  ),
                );
                break;
              case 1:
                context.read<MainNavigationBloc>().add(LetterScreenEvent());
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const KemajuanDesa(),
                  ),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const NoTeleponPenting(),
                  ),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const PenggunaanAnggaran(),
                  ),
                );
                break;
              case 5:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CekDpt(),
                  ),
                );
                break;
              case 6:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CekBansos(),
                  ),
                );
                break;
              case 7:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CekBantuanUmkm(),
                  ),
                );
                break;
            }
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Container(
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
                color: Colors.lightGreen.shade200,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Icon(
                    _listItemButton[index]['icon'],
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Text(
                  _listItemButton[index]['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color.fromRGBO(136, 188, 69, 1),
                    Color.fromRGBO(93, 179, 26, 1),
                    Color.fromRGBO(23, 133, 21, 1)
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Selamat Datang",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/images/codebreak.png',
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Layanan Desa",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: myHomeButtonList,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 55.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Berita Desa",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                      )
                      // color: Colors.lightGreen.shade200,
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                      height: 300,
                      child: ListView.separated(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        itemBuilder: (context, index) {
                          return _buildCardNews(index);
                        },
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

  Widget _buildCardNews(int index) => Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
              'https://source.unsplash.com/random?sig=$index&shoes',
            ),
            fit: BoxFit.cover,
            opacity: 150,
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    'Judul Berita ${index + 1}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    '11 Januari 2023',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
