import 'package:flutter/material.dart';

class IklanContent extends StatelessWidget {
  final String imageUrl;
  const IklanContent({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            offset: Offset(1, 2),
          )
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
      // child: Text(data?[itemIndex].gambar ?? ''),
    );
  }
}
