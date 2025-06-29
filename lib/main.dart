import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peta Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MapSample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? _mapController;
  MapType _currentMapType = MapType.normal;

  final LatLng _center = const LatLng(-0.9441, 100.4172); // Politeknik Negeri Padang

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _changeMapType(MapType type) {
    setState(() {
      _currentMapType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 16.0),
            mapType: _currentMapType,
            markers: {
              const Marker(
                markerId: MarkerId('pnp'),
                position: LatLng(-0.9441, 100.4172),
                infoWindow: InfoWindow(title: 'Politeknik Negeri Padang'),
              ),
            },
          ),
          Positioned(
            top: 80,
            left: 10,
            child: Column(
              children: [
                _mapIconButton(Icons.map, MapType.normal, 'Normal'),
                const SizedBox(height: 10),
                _mapIconButton(Icons.satellite, MapType.satellite, 'Satellite'),
                const SizedBox(height: 10),
                _mapIconButton(Icons.terrain, MapType.terrain, 'Terrain'),
                const SizedBox(height: 10),
                _mapIconButton(Icons.layers, MapType.hybrid, 'Hybrid'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapIconButton(IconData icon, MapType type, String tooltip) {
    return FloatingActionButton(
      heroTag: tooltip,
      mini: true,
      backgroundColor: _currentMapType == type ? Colors.blue : Colors.grey,
      onPressed: () => _changeMapType(type),
      tooltip: tooltip,
      child: Icon(icon, size: 20),
    );
  }
}
