import 'package:coinbase_test/provider/coins.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "History",
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          Center(
            child: Text(
              "Sort/Filter",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ChangeNotifierProvider<CoinsProvider>(
          create: (context) => CoinsProvider(),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Consumer<CoinsProvider>(builder: (context, coins, child) {
                coins.coinsList();
                return coins.coins == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: coins.coins!.length,
                          itemBuilder: (context, index) {
                            String imgPath = coins.coins![index].image ??
                                "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg";
                            String date = coins.coins![index].last_updated!;
                            double price = coins.coins![index].current_price!;
                            String name = coins.coins![index].name!;
                            return CoinsBox(
                              ImagePath: imgPath,
                              date: date,
                              price: price,
                              name: name,
                            );
                          },
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CoinsBox extends StatelessWidget {
  const CoinsBox({
    Key? key,
    this.ImagePath,
    this.name,
    this.date,
    this.price,
  }) : super(key: key);
  final String? ImagePath;
  final String? name;

  final String? date;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            height: 68,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD3D3D3).withOpacity(.84),
                  spreadRadius: 5,
                  blurRadius: 33,
                  offset: Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                ImagePath!,
                height: 54,
              ),
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                name!,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                price!.toString(),
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                date!,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Spacer(),
          Text(
            "Sort/Filter",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
