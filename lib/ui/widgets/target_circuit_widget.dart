import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/agency_model.dart';
import 'package:travel_app/models/destination_models.dart';
import 'package:travel_app/pages/customer/circuit_detail_page.dart';
import 'package:travel_app/ui/general/colors.dart';
import 'package:travel_app/ui/widgets/general_widgets.dart';

class TargetCircuitWidget extends StatefulWidget {

  DestinationModel destinationModel;
  AgencyModel agencyModel;

  TargetCircuitWidget({
    required this.destinationModel,
    required this.agencyModel,
  });

  @override
  State<TargetCircuitWidget> createState() => _TargetCircuitWidgetState();
}

class _TargetCircuitWidgetState extends State<TargetCircuitWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(14.0),
          splashColor: Colors.black.withOpacity(0.08),
          highlightColor: Colors.black.withOpacity(0.05),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CircuitDatailPage(
                  destinationModel: widget.destinationModel,
                  agencyModel: widget.agencyModel,
                ),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12.0,
                  offset: const Offset(4, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.agencyModel.circuit.circuit0.imagepoints.first,
                      fadeInCurve: Curves.easeIn,
                      imageBuilder: (context, imageProvider) {
                        return Hero(
                          tag: widget.destinationModel.id!,
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider,
                                ),
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(30))),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kBrandSecondaryColor,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 20.0,
                                ),
                                child: Text(
                                  widget.agencyModel.name,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.agencyModel.circuit.circuit0.name,
                            style: GoogleFonts.poppins(
                              color: kBrandPrimaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.agencyModel.department,
                            style: GoogleFonts.poppins(
                              color: kBrandSecondaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      divider20,
                      Text(
                        widget.agencyModel.department,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      divider6,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Desde",
                                style: GoogleFonts.poppins(
                                  color: kBrandPrimaryColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "S/.",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                        height: 2),
                                  ),
                                  Text(
                                    widget.agencyModel.circuit.circuit0.cost.toStringAsFixed(2),
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "Partida: ${widget.agencyModel.circuit.circuit0.departure} | Retorno: ${widget.agencyModel.circuit.circuit0.comeback}",
                        style: GoogleFonts.poppins(
                          color: kBrandSecondaryColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        divider40,
      ],
    );
  }
}
