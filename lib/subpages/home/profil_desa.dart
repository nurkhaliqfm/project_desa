import 'package:flutter/material.dart';

class ProfilDesa extends StatefulWidget {
  const ProfilDesa({super.key});

  @override
  State<ProfilDesa> createState() => _ProfilDesaState();
}

class _ProfilDesaState extends State<ProfilDesa> {
  final List<Map<String, dynamic>> _listPotensiDesa = [
    {"title": "Pantai 1", 'tag': "Potensi Wisata"},
    {"title": "Pantai 2", 'tag': "Potensi Wisata"},
    {"title": "Rumput Laut", 'tag': "Potensi Alam"},
    {"title": "Cemilan Rumput Laut", 'tag': "Potensi Kuliner"},
  ];

  @override
  Widget build(BuildContext context) {
    final List<Container> potensiListItem = List.generate(
      _listPotensiDesa.length,
      (index) {
        return Container(
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
                    Flexible(
                      child: Text(
                        _listPotensiDesa[index]['title'],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      _listPotensiDesa[index]['tag'],
                      textAlign: TextAlign.start,
                      style: const TextStyle(
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
      },
    );

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
                      'Profil Desa',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView(
                  children: [
                    Image.asset(
                      'assets/images/codebreak.png',
                      height: 200.0,
                      width: 200.0,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Text(
                              'Andi Muhammad Arfan Basmin, SH',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            const Text(
                              'Kepala Desa Lampenai',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                            const Text(
                              'Assalamu\'alaikum warahmatullahi wabarakatuh. Selamat Datang di “Website Desa Senga Selatan“, melalui website ini kami berupaya menghadirkan informasi seputar kegiatan dan program Desa Senga Selatan“, Kecamatan Belopa, Kabupaten Luwu, Prov. Sulawesi Selatan. Website ini kami hadirkan untuk mengikuti perkembangan dunia Teknologi Informasi (IT) yang kian pesat. Lahir dari sebuah ide kreatif dan inovatif, serta merupakan sebuah terobosan kami untuk lebih mendekatkan diri kepada masyarakat luas. Kami berupaya agar informasi tentang Desa Senga Selatan menjadi lebih terbuka dan interaktif. Kami sampaikan terima kasih kepada semua pihak yang telah banyak memberikan bantuan, dukungan dan kontribusi, baik berupa tenaga, pemikiran dan dorongan semangat, hingga Website ini dapat terealisasi. Semoga dengan adanya Website ini dapat bermanfaat dan menjadi salah satu upaya peningkatan pelayanan Desa Senga Selatan.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            GridView.count(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: potensiListItem,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
