import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/agency_model.dart';
import 'package:travel_app/models/destination_models.dart';

class FirestoreService {
  final String collection;

  FirestoreService({
    required this.collection,
  });

  late final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(collection);
//------------------------------------------------------------------------------
  Future<List<DestinationModel>> getDestinations() async {
    //Lista de Mapas
    // List<Map<String, dynamic>> destinations = [];

    //Lista de Models
    List<DestinationModel> destinations = [];
    QuerySnapshot _querySnapshot = await _collectionReference.get();

    _querySnapshot.docs.forEach((element) {
      //Uso de mapa
      // Map<String,dynamic> product = element.data() as Map<String, dynamic>;
      // product["id"] = element.id;

      //Uso de modelo
      DestinationModel destinationModel =
          DestinationModel.fromJson(element.data() as Map<String, dynamic>);
      destinationModel.id = element.id;
      destinations.add(destinationModel);
    });

    // print(destinations[1].toJson());

    return destinations;
  }

//------------------------------------------------------------------------------
//   Future<List> getAgencies() async {
//     List<Map<String,dynamic>> agencies = [];
//     QuerySnapshot _querySnapshot = await _collectionReference.get();
//
//     _querySnapshot.docs.forEach((element) {
//       Map<String,dynamic> agency = element.data() as Map<String,dynamic>;
//       agency["id"] = element.id;
//       agencies.add(agency);
//     });
//     print(agencies[0]);
//     return agencies;
//   }
// //------------------------------------------------------------------------------
  Future<List<AgencyModel>> getAgencies() async {
    List<AgencyModel> agencies = [];
    QuerySnapshot _querySnapshot = await _collectionReference.get();
    _querySnapshot.docs.forEach((element) {
      AgencyModel agencyModel =
          AgencyModel.fromJson(element.data() as Map<String, dynamic>);
      agencyModel.id = element.id;
      agencies.add(agencyModel);
    });

    print(agencies[0].toJson());

    return agencies;
  }

//------------------------------------------------------------------------------
}
