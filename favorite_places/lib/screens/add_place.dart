import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:favorite_places/places_model.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  PlaceLocation? _location;
  var link;

  File? _selectedImage;

  void getLocation(PlaceLocation location) async {
    _location = location;

    final lat = _location!.latitude;
    final long = _location!.longitude;

    final ans = await http.get(
      Uri.parse(
          'https://maps.locationiq.com/v3/staticmap?key=pk.77b163eb2dca86fab67c15c69967ea02&center=$lat,$long&zoom=16&size=600x600&format=jpg&markers=icon:large-blue-cutout%7C$lat,$long'),
    );

    Uint8List imageBytes = ans.bodyBytes;

    setState(() {
      link = imageBytes;
    });
  }

  void _savePlace() async {
    final enteredText = _titleController.text;

    if (enteredText.isEmpty || _selectedImage == null || _location == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text(
                    'Please make sure you have entered correct values: '),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'))
                ],
              ));
      return;
    }

    ref
        .read(usersPlacesNotifier.notifier)
        .addPlace(enteredText, _selectedImage!, _location!);

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            ImageInput(onPickImage: (image) {
              _selectedImage = image;
            }),
            const SizedBox(
              height: 16,
            ),
            LocationInput(location: getLocation),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              label: const Text('Add Place'),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
