import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SearchToiletPage extends StatefulWidget {
  const SearchToiletPage({super.key});

  @override
  State<SearchToiletPage> createState() => _SearchToiletPageState();
}

class _SearchToiletPageState extends State<SearchToiletPage> {
  @override
  void initState() {
    super.initState();
    //_determinePosition();
    _searchLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('今一番近くのトイレ'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Image.network(
              'https://lh3.googleusercontent.com/p/AF1QipOYL_tdFgqHRDOTD7jYTPu1coxpigFbKyZlwOji=s1360-w1360-h1020'),
          const SizedBox(height: 8),
          const Text('トイレ名',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              //Todo, GoogleMapへ遷移
            },
            child: const Text('Google Mapへ'),
          ),
        ],
      ),
    );
  }

Future _searchLocation() async {
  final position = await _determinePosition();
  print(position.latitude);
  print(position.longitude);
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('設定にて位置情報を許可してください');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('設定にて位置情報を許可してください');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error('設定にて位置情報を許可してください');
  } 
  return await Geolocator.getCurrentPosition();
}



}

