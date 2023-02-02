import 'package:flutter/material.dart';

import '../../main_navigation.dart';

class KemajuanDesa extends StatefulWidget {
  const KemajuanDesa({super.key});

  @override
  State<KemajuanDesa> createState() => _KemajuanDesaState();
}

class _KemajuanDesaState extends State<KemajuanDesa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Kemajuan Desa"),
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
    );
  }
}
