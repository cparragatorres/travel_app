import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/agency_model.dart';
import 'package:travel_app/models/destination_models.dart';
import 'package:travel_app/pages/customer/home_customer_page.dart';
import 'package:travel_app/ui/general/colors.dart';
import 'package:travel_app/ui/widgets/general_widgets.dart';
import 'package:travel_app/ui/widgets/target_circuit_widget.dart';
import 'package:travel_app/ui/widgets/text_widget.dart';

class DestinationsDetailPage extends StatelessWidget {
  DestinationModel destinationModel;

  DestinationsDetailPage({
    required this.destinationModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeCustomerPage()));
          },
          icon: Icon(Icons.chevron_left),
          splashRadius: 20,
          color: Colors.black,
        ),
        title: TextNormal(
          text: "Circuitos en ${destinationModel.department}",
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TargetCircuitWidget(
                  imagen: destinationModel.image,
                  costo: 51,
                  departamento: destinationModel.department,
                  descripcion: destinationModel.department,
                  nombreAgencia: destinationModel.nombreagencia,
                  nombreCircuito: destinationModel.department,
                  partida: destinationModel.department,
                  retorno: destinationModel.department,
                  destinationModel: destinationModel,
                ),
                divider20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
