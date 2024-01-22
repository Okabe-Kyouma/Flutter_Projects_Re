import 'package:favorite_places/places_model.dart';
import 'package:favorite_places/widgets/map_display.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final PlacesModel place;

  @override
  Widget build(BuildContext context) {
    void openMapFromDetails() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MapDisplay(place: place),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 76,
              child: GestureDetector(
                onTap: openMapFromDetails,
                child: Image.memory(
                  place.location.link,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black87,
                    Colors.black87.withOpacity(0.2),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Text(
                  place.location.address,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
