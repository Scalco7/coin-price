import 'package:coin_price/common/models/coin.dart';
import 'package:coin_price/features/screens/home/widgets/coin_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.coins});
  final List<Coin> coins;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Coin> coinsList;

  void filterList(String name) {
    setState(() {
      coinsList = widget.coins
          .where((coin) => coin.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    coinsList = widget.coins;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "🤑 Coin Price 🤑",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Center(
                          child: TextField(
                            onChanged: (String value) => filterList(value),
                            cursorColor: Colors.black.withOpacity(0.6),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              label: Text("Pesquisar..."),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: coinsList.map((e) => CoinWidget(coin: e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
