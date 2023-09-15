import 'package:coin_price/common/consts/consts.dart';
import 'package:coin_price/common/models/coin.dart';
import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  const CoinWidget({super.key, required this.coin});
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 20,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                coin.name,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: coin.img != null
                      ? Image.network(coin.img!, fit: BoxFit.contain)
                      : Image.network(Consts.linkIcon, fit: BoxFit.contain),
                ),
                Flexible(
                  child: Text(
                    "${coin.price.toStringAsFixed(2)}R\$",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
