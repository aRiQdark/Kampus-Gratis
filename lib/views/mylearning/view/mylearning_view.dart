import 'package:flutter/material.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class MylearningView extends StatelessWidget {
  const MylearningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      appBar: AppBar(
        title: (const Text('Studi Ku')),
      ),
      body: const Center(
        child: Text('Studi Ku'),
      ),
      bottomMenuIndex: 1,
    );
  }
}
