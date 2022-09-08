import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/agency_model.dart';
import 'package:travel_app/models/destination_models.dart';
import 'package:travel_app/pages/customer/home_customer_page.dart';
import 'package:travel_app/ui/general/colors.dart';
import 'package:travel_app/ui/widgets/general_widgets.dart';
import 'package:travel_app/ui/widgets/target_circuit_widget.dart';
import 'package:travel_app/ui/widgets/text_widget.dart';

import '../../services/firestore_service.dart';

//PAGINA 2

class DestinationsDetailPage extends StatelessWidget {
  DestinationModel destinationModel;
  AgencyModel agencyModel;

  DestinationsDetailPage({
    required this.destinationModel,
    required this.agencyModel,
  });

  final FirestoreService _agenciesService =
  FirestoreService(collection: "agency");


  List<AgencyModel> agencies = [];


  getDataFirebase() async {
    agencies = await _agenciesService.getAgencies();
  }


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
                  destinationModel: destinationModel,
                  agencyModel: agencies[index],
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
