import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/agency_model.dart';
import 'package:travel_app/services/firestore_service.dart';

import 'package:flutter/material.dart';
import 'package:travel_app/models/destination_models.dart';
import 'package:travel_app/ui/widgets/general_widgets.dart';
import 'package:travel_app/ui/widgets/item_grid_departamentos_widget.dart';
import 'package:travel_app/ui/widgets/search_widget.dart';
import 'package:travel_app/ui/widgets/text_widget.dart';

import '../../ui/general/colors.dart';

class HomeCustomerPage extends StatefulWidget {
  @override
  State<HomeCustomerPage> createState() => _HomeCustomerPageState();
}

class _HomeCustomerPageState extends State<HomeCustomerPage> {
  // final FirestoreService _agenciesService =
  //     FirestoreService(collection: "agency");
  final FirestoreService _destinationsService =
      FirestoreService(collection: "destination");

  List<DestinationModel> destinations = [];
  // List<AgencyModel> agencies = [];

  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFirebase();
  }

  getDataFirebase() async {
    // agencies = await _agenciesService.getAgencies();
    destinations = await _destinationsService.getDestinations();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                child: Stack(
                  children: [
                    //Stack Nivel 1
                    Container(
                      //imagen de machupichu de fondo
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.colorBurn,
                          ),
                          image: AssetImage(
                            //imagen de machupicchu
                            "assets/images/mainCover.jpg",
                          ),
                        ),
                      ),
                    ),
                    //Stack Nivel 2
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Bienvenido",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "TravelApp",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                            color: kBrandPrimaryColor,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black,
                                                blurRadius: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3.5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kBrandSecondaryColor,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        kBrandPrimaryColor,
                                        kBrandSecondaryColor,
                                      ],
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: CachedNetworkImage(
                                      //avatar image
                                      imageUrl:
                                          "https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                      fadeInCurve: Curves.easeIn,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          divider20,
                          TextNormal(
                            text: "Experiencias increíbles que te hacen feliz",
                            color: Colors.white,
                          ),
                          divider20,
                          // barra de busqueda
                          SearchWidget(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 20,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: TextNormal(
                        text: "Departamentos",
                      ),
                    ),
                    divider12,
                    Container(
                      height: 2400,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        itemCount: destinations.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                        ),
                        itemBuilder: (context, index) =>
                            ItemGridDepartamentosWidget(
                          destinationModel: destinations[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
