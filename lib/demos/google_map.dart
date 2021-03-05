import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapPage> {
  //Intial Postion of My

  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();

  Set<Marker> _markers = HashSet<Marker>();
  // int _markerIdCounter = 1;

  // void _setMarkers(LatLng point) {
  //   final String markerIdVal = 'marker_id_$_markerIdCounter';
  //   _markerIdCounter++;
  //   setState(() {
  //     _markers.add(
  //       Marker(
  //         markerId: MarkerId(markerIdVal),
  //         position: point,
  //       ),
  //     );
  //   });
  // }

  MapType _currentMapType = MapType.normal;

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('0'),
          position: _initialcameraposition,
          infoWindow: InfoWindow(
              title: 'Current Location', snippet: 'Um bom lugar para estar'),
          // icon: _markerIcon,
        ),
      );
    });
    _location.onLocationChanged.listen((l) {
      print(l);
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  void _chanagecurrentMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              markers: _markers,
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: _currentMapType,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              // On Click in Google Map
              // onTap: (point) {
              //   setState(() {
              //     _markers.clear();
              //     _setMarkers(point);
              //   });
              // },
            ),
            Positioned(
              top: 10,
              left: 10,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                child: new IconButton(
                  iconSize: 35,
                  icon: Icon(
                    Icons.map_sharp,
                    color: Colors.white,
                  ),
                  onPressed: _chanagecurrentMapType,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
