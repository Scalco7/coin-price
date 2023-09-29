import 'package:coin_price/common/repositories/coin_repository.dart';
import 'package:coin_price/features/screens/home/container/home_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: HomeContainer(
        repository: CoinRepository(),
      ),
    );
  }
}
