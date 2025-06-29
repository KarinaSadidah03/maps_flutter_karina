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

  final LatLng _center = const LatLng(-0.9441, 100.4172); // PNP

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _changeMapType(MapType type) {
    setState(() {
      _currentMapType = type;
    });
  }

  Set<Marker> _buildMarkers() {
    return {
      const Marker(
        markerId: MarkerId('pnp'),
        position: LatLng(-0.9441, 100.4172),
        infoWindow: InfoWindow(title: 'Politeknik Negeri Padang'),
      ),
      const Marker(
        markerId: MarkerId('smansa'),
        position: LatLng(-0.9305, 100.3651),
        infoWindow: InfoWindow(title: 'SMA Negeri 1 Padang'),
      ),
      const Marker(
        markerId: MarkerId('smanda'),
        position: LatLng(-0.9293, 100.3678),
        infoWindow: InfoWindow(title: 'SMA Negeri 2 Padang'),
      ),
      const Marker(
        markerId: MarkerId('smantiga'),
        position: LatLng(-0.9365, 100.3632),
        infoWindow: InfoWindow(title: 'SMA Negeri 3 Padang'),
      ),
      const Marker(
        markerId: MarkerId('smanka'),
        position: LatLng(-0.9151, 100.4602),
        infoWindow: InfoWindow(title: 'SMA Negeri 4 Padang'),
      ),
      const Marker(
        markerId: MarkerId('smandel'),
        position: LatLng(-0.9062, 100.3799),
        infoWindow: InfoWindow(title: 'SMA Negeri 5 Padang'),
      ),
      const Marker(
        markerId: MarkerId('sman6'),
        position: LatLng(-0.9483, 100.4085),
        infoWindow: InfoWindow(title: 'SMA Negeri 6 Padang'),
      ),
      const Marker(
        markerId: MarkerId('sman7'),
        position: LatLng(-0.9165, 100.4501),
        infoWindow: InfoWindow(title: 'SMA Negeri 7 Padang'),
      ),
      const Marker(
        markerId: MarkerId('sman8'),
        position: LatLng(-0.9402, 100.4004),
        infoWindow: InfoWindow(title: 'SMA Negeri 8 Padang'),
      ),
      const Marker(
        markerId: MarkerId('sman9'),
        position: LatLng(-0.9541, 100.3611),
        infoWindow: InfoWindow(title: 'SMA Negeri 9 Padang'),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 13.0),
            mapType: _currentMapType,
            markers: _buildMarkers(),
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
