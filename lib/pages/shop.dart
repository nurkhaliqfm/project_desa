import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_desa/bloc/e_pasar/pasar_filter_tag_bloc.dart';

import '../bloc/main_navigation/main_navigation_bloc.dart';
import '../function/currency_format.dart';

var listTag = ['makanan', 'minuman'];
var listAllTag = ['all', 'makanan', 'minuman'];

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    final List<Map> myListMenu = List.generate(
        20,
        (index) => {
              "id": index,
              "name": "Product ${index + 1}",
              "price": (index + Random().nextInt(20)) * 10000,
              "tag": listTag[Random().nextInt(2)]
            }).toList();

    return WillPopScope(
      onWillPop: () async {
        context.read<MainNavigationBloc>().add(HomeScreenEvent());
        return false;
      },
      child: BlocProvider(
        create: (context) => PasarFilterTagBloc(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10.0),
          child: Column(
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
                        onPressed: () {},
                        child: const Icon(
                          Ionicons.search_outline,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'E-Pasar',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: Colors.black26)),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: TextButton(
                        onPressed: () {},
                        child: const Icon(
                          Ionicons.options_outline,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                child: BlocBuilder<PasarFilterTagBloc, PasarFilterTagState>(
                  builder: (context, state) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: listAllTag.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: state.tag == listAllTag[index]
                                  ? Colors.lightGreen.shade200
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1,
                                  color: state.tag == listAllTag[index]
                                      ? Colors.lightGreen.shade200
                                      : Colors.black26)),
                          child: SizedBox(
                            child: TextButton(
                              onPressed: () {
                                if (index == 0) {
                                  context
                                      .read<PasarFilterTagBloc>()
                                      .add(AllPasarFilter());
                                } else if (index == 1) {
                                  context
                                      .read<PasarFilterTagBloc>()
                                      .add(MakananPasarFilter());
                                } else if (index == 2) {
                                  context
                                      .read<PasarFilterTagBloc>()
                                      .add(MinumanPasarFilter());
                                }
                              },
                              child: Text(
                                listAllTag[index].toString().replaceFirst(
                                    listAllTag[index][0],
                                    listAllTag[index][0].toUpperCase()),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Flexible(
                child: BlocBuilder<PasarFilterTagBloc, PasarFilterTagState>(
                  builder: (context, state) {
                    return MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 10,
                      itemCount: myListMenu.length,
                      itemBuilder: (context, index) {
                        if (state.tag != 'all') {
                          if (myListMenu[index]['tag'] == state.tag) {
                            return _buildItemPasar(myListMenu, index);
                          }
                        } else if (state.tag == 'all') {
                          return _buildItemPasar(myListMenu, index);
                        }

                        return Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          height: 0,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemPasar(List<Map> itemMenu, int index) => (Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // height: Random().nextInt(100) + 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://source.unsplash.com/random?sig=$index&shoes',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 85,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              itemMenu[index]['tag'].toString().replaceFirst(
                                  itemMenu[index]['tag'][0],
                                  itemMenu[index]['tag'][0]
                                      .toString()
                                      .toUpperCase()),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                        Text(
                          itemMenu[index]['name'],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        CurrencyFormat.convertToIdr(
                            itemMenu[index]['price'], 0),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ));
}
