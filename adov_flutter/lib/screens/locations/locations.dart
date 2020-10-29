// lib/screens/locations/locations.dart

import 'package:adov_flutter/widgets/image_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';
import './tile_overlay.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
        appBar: AppBar(
          title: Text('Locations'),
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) =>
                _itemBuilder(context, locations[index])));
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      key: Key('location_list_item_${location.id}'),
      onTap: () => _onLocationTap(context, location.id),
      child: Container(
        height: 245.0,
        child: Stack(
          children: [
            ImageBanner(assetPath: location.imagePath, height: 245.0),
            TileOverlay(location),
          ],
        ),
      ),
    );
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationID});
  }
}
