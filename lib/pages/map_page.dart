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

  final Set<Marker> _schoolMarkers = {
    Marker(
      markerId: MarkerId('polinpdg'),
      position: LatLng(-0.9441, 100.4172),
      infoWindow: InfoWindow(title: 'Politeknik Negeri Padang'),
    ),
    Marker(
      markerId: MarkerId('smansa'),
      position: LatLng(-0.9305, 100.3651),
      infoWindow: InfoWindow(title: 'SMA Negeri 1 Padang'),
    ),
    Marker(
      markerId: MarkerId('smanda'),
      position: LatLng(-0.9194, 100.3640),
      infoWindow: InfoWindow(title: 'SMA Negeri 2 Padang'),
    ),
    Marker(
      markerId: MarkerId('smantiga'),
      position: LatLng(-0.9023, 100.3681),
      infoWindow: InfoWindow(title: 'SMA Negeri 3 Padang'),
    ),
    Marker(
      markerId: MarkerId('smanempat'),
      position: LatLng(-0.9468, 100.4225),
      infoWindow: InfoWindow(title: 'SMA Negeri 4 Padang'),
    ),
    Marker(
      markerId: MarkerId('smankelima'),
      position: LatLng(-0.9439, 100.3791),
      infoWindow: InfoWindow(title: 'SMA Negeri 5 Padang'),
    ),
    Marker(
      markerId: MarkerId('smanenam'),
      position: LatLng(-0.8892, 100.3553),
      infoWindow: InfoWindow(title: 'SMA Negeri 6 Padang'),
    ),
    Marker(
      markerId: MarkerId('smanjuh'),
      position: LatLng(-0.9084, 100.3684),
      infoWindow: InfoWindow(title: 'SMA Negeri 7 Padang'),
    ),
    Marker(
      markerId: MarkerId('smandelapan'),
      position: LatLng(-0.9431, 100.3686),
      infoWindow: InfoWindow(title: 'SMA Negeri 8 Padang'),
    ),
    Marker(
      markerId: MarkerId('sman18'),
      position: LatLng(-0.9502, 100.3939),
      infoWindow: InfoWindow(title: 'SMA Negeri 18 Padang'),
    ),
  };

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
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
            mapType: _currentMapType,
            markers: _schoolMarkers,
          ),
          Positioned(
            top: 40,
            left: 16,
            child: FloatingActionButton(
              heroTag: 'mapTypeBtn',
              mini: true,
              backgroundColor: Colors.white,
              onPressed: _switchMapType,
              child: const Icon(Icons.layers, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
