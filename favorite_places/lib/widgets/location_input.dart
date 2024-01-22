import 'dart:convert';
import 'dart:typed_data';

import 'package:favorite_places/places_model.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.location});

  final void Function(PlaceLocation location) location;

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  // Location? _pickedLocation;
  var _isGettingLocation = false;
  var long;
  var lat;
  bool isFetchingData = false;
  PlaceLocation? _location;

  String convertAddressToString(Map<String, dynamic> addressMap) {
    List<String> keyValuePairs = [];

    addressMap.forEach((key, value) {
      keyValuePairs.add('$key: $value');
    });

    return keyValuePairs.join(', ');
  }

  void getLocation(double latitude, double longitude, String address) async {
    final lat = latitude;
    final long = longitude;

    final ans = await http.get(
      Uri.parse(
          'https://maps.locationiq.com/v3/staticmap?key=pk.77b163eb2dca86fab67c15c69967ea02&center=$lat,$long&zoom=16&size=600x600&format=jpg&markers=icon:large-blue-cutout%7C$lat,$long'),
    );

    Uint8List imageBytes = ans.bodyBytes;

    setState(() {
      isFetchingData = false;
      _location = PlaceLocation(
          latitude: latitude,
          longitude: longitude,
          address: address,
          link: imageBytes);
    });

    widget.location(_location!);
  }

  void _getCurrentLocation() async {
    Location location = Location();

    setState(() {
      isFetchingData = true;
    });

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    // LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    // locationData = await location.getLocation();

    long = 78.008072;
    lat = 27.176670;

    var uri = Uri.parse(
        'https://us1.locationiq.com/v1/reverse?key=pk.77b163eb2dca86fab67c15c69967ea02&lat=$lat&lon=$long&format=json');

    final data = await http.get(uri);

    final resData = json.decode(data.body);

    final String address = convertAddressToString(resData['address']);

    getLocation(lat, long, address);

    setState(() {
      _isGettingLocation = false;
      isFetchingData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No location Chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }

    if (_location != null && !isFetchingData) {
      previewContent = Image.memory(
        _location!.link,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          )),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Get Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select On Map'),
            ),
          ],
        ),
      ],
    );
  }
}
