import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  MapType _currentMapType = MapType.normal;
  int _mapTypeIndex = 0;

  final List<MapType> _mapTypes = [
    MapType.normal,
    MapType.satellite,
    MapType.terrain,
    MapType.hybrid,
  ];

  final LatLng _center = const LatLng(-0.9441, 100.4172);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _switchMapType() {
    setState(() {
      _mapTypeIndex = (_mapTypeIndex + 1) % _mapTypes.length;
      _currentMapType = _mapTypes[_mapTypeIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map 4 Tema')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        mapType: _currentMapType,
        markers: {
          Marker(
            markerId: const MarkerId('polinpdg'),
            position: _center,
            infoWindow: const InfoWindow(title: 'Politeknik Negeri Padang'),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _switchMapType,
        tooltip: 'Ganti Tipe Peta',
        child: const Icon(Icons.map),
      ),
    );
  }
}
