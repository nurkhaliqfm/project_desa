import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_desa/bloc/identitas_desa/identitas_desa_bloc.dart';

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

    return BlocProvider(
      create: (context) => IdentitasDesaBloc()..add(GetIdentitasDesa()),
      child: Scaffold(
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
                      'Profil Desa',
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
                          child: BlocBuilder<IdentitasDesaBloc,
                              IdentitasDesaState>(
                            builder: (context, state) {
                              if (state is IdentitasDesaLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (state is IdentitasDesaSuccess) {
                                return Column(
                                  children: [
                                    Text(
                                      state.identitasDesa[0].namaKades,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'Kepala Desa ${state.identitasDesa[0].namaDesa}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      state.identitasDesa[0].deskripsi,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    GridView.count(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0),
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: potensiListItem,
                                    ),
                                  ],
                                );
                              }
                              return const Center(
                                child: Text('No Data'),
                              );
                            },
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
      ),
    );
  }
}
