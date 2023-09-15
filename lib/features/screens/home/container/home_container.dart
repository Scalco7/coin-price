import 'package:coin_price/common/models/coin.dart';
import 'package:coin_price/common/repositories/coin_repository.dart';
import 'package:coin_price/features/screens/home/pages/home_error.dart';
import 'package:coin_price/features/screens/home/pages/home_loading.dart';
import 'package:coin_price/features/screens/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.repository});
  final CoinRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Coin>>(
      future: repository.getAllCoins(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(coins: snapshot.data!);
        }
        if (snapshot.hasError) {
          return HomeError(message: snapshot.error as String);
        }

        return Container();
      },
    );
  }
}
