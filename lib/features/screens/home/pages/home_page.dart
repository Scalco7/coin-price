import 'package:coin_price/common/models/coin.dart';
import 'package:coin_price/features/screens/home/widgets/coin_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.coins});
  final List<Coin> coins;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.vertical,
          children: coins.map((e) => CoinWidget(coin: e)).toList(),
        ),
      ),
    );
  }
}
