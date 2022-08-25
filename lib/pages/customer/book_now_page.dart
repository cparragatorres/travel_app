import 'package:flutter/material.dart';
import 'package:travel_app/ui/general/colors.dart';

class BookNowPage extends StatelessWidget {
  const BookNowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("RESERVA AHORA"),
        centerTitle: true,
        backgroundColor: kBrandPrimaryColor,
      ),
      body: SafeArea(child: Column()),
    );
  }
}
