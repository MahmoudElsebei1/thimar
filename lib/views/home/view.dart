import 'package:flutter/material.dart';
import 'package:thimar/views/home/widgets/categories/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
        Column(
          children: [
            Categories(),
          ],
        )
    );
  }
}
