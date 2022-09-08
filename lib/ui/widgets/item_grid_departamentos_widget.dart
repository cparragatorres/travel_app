import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/agency_model.dart';
import 'package:travel_app/models/destination_models.dart';
import 'package:travel_app/pages/customer/destinations_detail_page.dart';
import 'package:travel_app/ui/general/colors.dart';

class ItemGridDepartamentosWidget extends StatefulWidget {
  DestinationModel destinationModel;
  AgencyModel agencyModel;

  ItemGridDepartamentosWidget({
    required this.destinationModel,
    required this.agencyModel,
  });

  @override
  State<ItemGridDepartamentosWidget> createState() =>
      _ItemGridDepartamentosState();
}

class _ItemGridDepartamentosState extends State<ItemGridDepartamentosWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14.0),
      splashColor: Colors.black.withOpacity(0.08),
      highlightColor: Colors.black.withOpacity(0.05),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationsDetailPage(
              destinationModel: widget.destinationModel,
              agencyModel: widget.agencyModel,
            ),
          ),
        );
      },
      child: CachedNetworkImage(
        imageUrl: widget.destinationModel.image,
        fadeInCurve: Curves.easeIn,
        imageBuilder: ((context, imageProvider) {
          return Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.3),
                  BlendMode.colorBurn,
                ),
                fit: BoxFit.cover,
                image: imageProvider,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffD1D9E6),
                  blurRadius: 1.0,
                  offset: const Offset(4.0, 4.0),
                ),
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                  offset: Offset(-4.0, -4.0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.destinationModel.department,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                Text(
                  "7 tours",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: kBrandSecondaryColor,
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
          );
        }),
      ),
    );
  }
}
