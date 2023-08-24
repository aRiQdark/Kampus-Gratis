import 'package:flutter/material.dart';
import 'package:kampus_gratis/widgets/bottom_navbar.dart';

class KGScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final int? bottomMenuIndex;
  final Widget body;
  final Color? backgroundColor;

  const KGScaffold({
    super.key,
    this.appBar,
    this.bottomMenuIndex,
    required this.body,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
      bottomNavigationBar:
          bottomMenuIndex != null ? KGBottomNavBar(bottomMenuIndex!) : null,
    );
  }
}
