import 'package:coin_price/common/consts/consts.dart';
import 'package:coin_price/common/models/coin.dart';
import 'package:dio/dio.dart';

abstract class ICoinRepository {
  Future<List<Coin>> getAllCoins();
}

class CoinRepository implements ICoinRepository {
  CoinRepository();
  final Dio dio = Dio();
  final Options options = Options(
      headers: {"X-CoinAPI-Key": "EE3405F1-60B2-4857-8488-F2B802B6B1BC"});

  @override
  Future<List<Coin>> getAllCoins() async {
    try {
      final valueResponse = await dio.get(
        Consts.linkValues,
        options: options,
      );
      final imageResponse = await dio.get(
        Consts.linkImgs,
        options: options,
      );

      final valueJson = valueResponse.data as List<dynamic>;
      final imageJson = imageResponse.data as List<dynamic>;

      final double brazilCoinValue =
          valueJson.where((e) => e['asset_id'] == "BRL").first['price_usd'];

      final List<Coin> list =
          valueJson.where((obj) => obj['type_is_crypto'] == 0).map((e) {
        final img = imageJson
            .where((img) => img['asset_id'] == e['asset_id'])
            .firstOrNull;
        final price = (e["price_usd"] ?? 1.0) / brazilCoinValue;
        return Coin.fromMap(jsonValue: e, img: img?["url"], price: price);
      }).toList();

      return list;
    } catch (e) {
      throw "não foi possível carregar os dados";
    }
  }
}
