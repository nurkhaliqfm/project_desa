import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../bloc/main_navigation/main_navigation_bloc.dart';

class News extends StatelessWidget {
  News({super.key});

  final List<Map> myListMenu = List.generate(
      20,
      (index) => {
            "id": index,
            "name": "Product $index",
            "price": (index + Random().nextInt(20)) * 10000,
          }).toList();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<MainNavigationBloc>().add(HomeScreenEvent());
        return false;
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 14),
              child: const Text(
                'Berita Desa',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Flexible(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 10,
                itemCount: myListMenu.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
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
                                width: (MediaQuery.of(context).size.width) / 2 -
                                    40,
                                margin: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Tag Desa',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Judul Berita ${index + 1}',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Flexible(
                                            child: Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
