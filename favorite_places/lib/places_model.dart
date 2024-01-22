import 'dart:io';
import 'dart:typed_data';

import 'package:uuid/uuid.dart';

const uid = Uuid();

class PlaceLocation {
  const PlaceLocation(
      {required this.latitude,
      required this.longitude,
      required this.address,
      required this.link});

  final double latitude;
  final double longitude;
  final String address;
  final Uint8List link;
}

class PlacesModel {
  PlacesModel(
      {required this.title, required this.image, required this.location,String? id})
      : id = id ?? uid.v4();

  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}
