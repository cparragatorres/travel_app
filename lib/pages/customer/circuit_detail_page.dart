import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/agency_model.dart';
import 'package:travel_app/models/destination_models.dart';
import 'package:travel_app/pages/customer/book_now_page.dart';
import 'package:travel_app/pages/customer/destinations_detail_page.dart';
import 'package:travel_app/ui/general/colors.dart';
import 'package:travel_app/ui/widgets/general_widgets.dart';
import 'package:travel_app/ui/widgets/point_widget.dart';
import 'package:travel_app/ui/widgets/text_widget.dart';

class CircuitDatailPage extends StatefulWidget {
  DestinationModel destinationModel;
  String imagen;
  String nombreAgencia;
  String nombreCircuito;
  String departamento;
  String descripcion;
  int costo;
  String partida;
  String retorno;


  CircuitDatailPage({
    required this.destinationModel,
    required this.imagen,
    required this.nombreAgencia,
    required this.nombreCircuito,
    required this.departamento,
    required this.descripcion,
    required this.costo,
    required this.partida,
    required this.retorno,

  });

  @override
  State<CircuitDatailPage> createState() => _CircuitDatailPageState();
}

class _CircuitDatailPageState extends State<CircuitDatailPage> {
  int quantity = 1;

  List<String> images = [
    "https://portal.andina.pe/EDPfotografia3/Thumbnail/2018/06/26/000514185W.jpg",
    "https://fastly.4sqi.net/img/general/600x600/7807452_ccXVGqUTwpAtXBhJxgb-zYCl_ThfrlOdC1H5EAS4hDw.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Tunanmarca-nX-41.jpg/410px-Tunanmarca-nX-41.jpg",
    "https://userscontent2.emaze.com/images/7cf1f8fd-8a05-459f-ae89-913c485ae2e5/4fc84476659f6caf2c95966bdd24c60c.jpg",
    "https://farm7.staticflickr.com/6079/6042357612_fa66ec08bd_o.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Plaza_principal_de_Jauja.jpg/1200px-Plaza_principal_de_Jauja.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/17/47/9e/e8/capilla-cristo-pobre.jpg",
    "https://portal.andina.pe/EDPfotografia/Thumbnail/2014/01/02/000229356W.jpg",
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 300,
                    child: Stack(
                      children: [
                        //Stack Nivel 1
                        CachedNetworkImage(
                          //imagen del Amazonas
                          imageUrl:
                              widget.destinationModel.image,
                          fadeInCurve: Curves.easeIn,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              //imagen de machupichu de fondo
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.colorBurn,
                                  ),
                                  image: imageProvider,
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 8.0,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DestinationsDetailPage(
                                    destinationModel: widget.destinationModel,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.arrow_back),
                            splashRadius: 20,
                            color: Colors.white,
                          ),
                        ),
                        //Stack Nivel 2
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 80.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context)
                                              .size
                                              .width
                                              .round() *
                                          0.5,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: kBrandSecondaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 8.0),
                                        child: Text(
                                          "S/ ${widget.costo.toStringAsFixed(2)}",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    divider6,
                                    Text(
                                      "Partida: 10:30 am | Retorno: 6:30 pm",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextNormal(
                                      text: widget.nombreCircuito,
                                      color: Colors.white,
                                    ),
                                    divider6,
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 48.0),
                                            child: Text(
                                              "Me Interesa",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        dividerWidth10,
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: kBrandPrimaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 8.0),
                                              child: Icon(
                                                Icons.favorite_border_outlined,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              divider20,
                              divider20,
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
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.where_to_vote_outlined,
                                  color: kBrandPrimaryColor),
                              dividerWidth10,
                              Text(
                                widget.departamento,
                                style: GoogleFonts.poppins(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          divider12,
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.descripcion,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          divider6,
                          TextNormal(
                            text: "Paradas",
                          ),
                          Container(
                            height: 250,
                            width: double.infinity,
                            child: Swiper(
                              // control: SwiperControl(color: kBrandSecondaryColor),
                              autoplay: true,
                              viewportFraction: 0.8,
                              scale: 0.9,
                              itemBuilder: (BuildContext context, int index) {
                                return CachedNetworkImage(
                                  imageUrl: images[index],
                                  fadeInCurve: Curves.easeIn,
                                  imageBuilder: (context, imageProvider) {
                                    return Image.network(
                                      alignment: Alignment.center,
                                      images[index],
                                      fit: BoxFit.fill,
                                    );
                                  },
                                );
                              },
                              duration: 1000,
                              layout: SwiperLayout.CUSTOM,
                              customLayoutOption: new CustomLayoutOption(
                                      startIndex: -1, stateCount: 3)
                                  .addRotate([
                                45.0 / 180,
                                0.0,
                                -45.0 / 180
                              ]).addTranslate([
                                new Offset(-370.0, -40.0),
                                new Offset(0.0, 0.0),
                                new Offset(370.0, 40.0)
                              ]),
                              itemWidth: 280.0,
                              itemHeight: 200.0,
                              itemCount: images.length,
                            ),
                          ),
                          divider12,
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Wrap(
                              spacing: 12.0,
                              runSpacing: 12.0,
                              children: [
                                // ...widget.productModel.department.map((e)=>PointWidget(text: e),).toList(),
                                PointWidget(
                                    text: widget.destinationModel.department),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  divider40,
                  divider40,
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70.0,
                margin: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 0.0,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      offset: const Offset(0, -5),
                      blurRadius: 12.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                side: BorderSide.none,
                              ),
                              primary: kBrandSecondaryColor),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookNowPage()));
                          },
                          child: Text(
                            "RESERVA AHORA",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
