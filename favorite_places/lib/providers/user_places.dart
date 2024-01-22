import 'dart:io';
import 'dart:typed_data';
import 'package:favorite_places/places_model.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<Database> _getDatabse() async {
  final dbPath = await sql.getDatabasesPath();

  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL,lng REAL, address TEXT, link TEXT)');
    },
    version: 1,
  );

  return db;
}

class UserPlacesNotifier extends StateNotifier<List<PlacesModel>> {
  UserPlacesNotifier() : super(const []);

  Future<void> loadPlaces() async {
    final db = await _getDatabse();

    final data = await db.query('user_places');

    final places = data
        .map(
          (e) => PlacesModel(
              id: e['id'] as String,
              title: e['title'] as String,
              image: File(e['image'] as String),
              location: PlaceLocation(
                  latitude: e['lat'] as double,
                  longitude: e['lng'] as double,
                  address: e['address'] as String,
                  link: e['link'] as Uint8List)),
        )
        .toList();

    state = places;
  }

  void addPlace(String title, File file, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();

    final fileName = path.basename(file.path);

    final copiedImage = await file.copy('${appDir.path}/$fileName');

    final newPlace =
        PlacesModel(title: title, image: copiedImage, location: location);

    state = [newPlace, ...state];

    final db = await _getDatabse();

    db.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'lat': newPlace.location.latitude,
        'lng': newPlace.location.longitude,
        'address': newPlace.location.address,
        'link': newPlace.location.link,
      },
    );
  }
}

final usersPlacesNotifier =
    StateNotifierProvider<UserPlacesNotifier, List<PlacesModel>>(
  (ref) => UserPlacesNotifier(),
);
