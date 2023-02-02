import 'package:flutter/material.dart';

class NoTeleponPenting extends StatefulWidget {
  const NoTeleponPenting({super.key});

  @override
  State<NoTeleponPenting> createState() => _NoTeleponPentingState();
}

class _NoTeleponPentingState extends State<NoTeleponPenting> {
  final List<Map<String, dynamic>> _listKontakDesa = [
    {"title": "Aparat Desa", 'tag': "081241285382"},
    {"title": "Damkar", 'tag': "081241285382"},
    {"title": "RSUD I Lagaligo", 'tag': "081241285382"},
    {"title": "PLN", 'tag': "081241285382"},
    {"title": "Puskesmas", 'tag': "081241285382"},
    {"title": "Karang Taruna", 'tag': "081241285382"},
    {"title": "Polsek Wotu", 'tag': "081241285382"},
  ];

  @override
  Widget build(BuildContext context) {
    final List<Container> potensiListItem = List.generate(
      _listKontakDesa.length,
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
                        _listKontakDesa[index]['title'],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      _listKontakDesa[index]['tag'],
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
                      'Telpon Penting',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView(children: [
                  GridView.count(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: potensiListItem,
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
