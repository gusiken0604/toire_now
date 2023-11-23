import 'package:flutter/material.dart';

class SearchToiletPage extends StatefulWidget {
  const SearchToiletPage({super.key});

  @override
  State<SearchToiletPage> createState() => _SearchToiletPageState();
}

class _SearchToiletPageState extends State<SearchToiletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
}
