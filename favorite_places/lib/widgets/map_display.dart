import 'package:favorite_places/places_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapDisplay extends StatelessWidget {
  const MapDisplay({super.key, required this.place});

  final PlacesModel place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter:
              LatLng(place.location.latitude, place.location.longitude),
          initialZoom: 19,
          applyPointerTranslucencyToLayers: true,
          maxZoom: 100,
        ),
        children: [
          TileLayer(
            zoomOffset: 100,
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          CurrentLocationLayer(
            style: const LocationMarkerStyle(
              marker: DefaultLocationMarker(
                child: Icon(
                  Icons.navigation,
                  color: Colors.white,
                ),
              ),
              markerSize: Size(40, 40),
              markerDirection: MarkerDirection.heading,
            ),
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () =>
                    launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
