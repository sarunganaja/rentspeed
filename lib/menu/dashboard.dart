import 'package:flutter/material.dart';

class CardItem {
  final String gambar;
  final String title;
  final String subtitle;

  const CardItem(
      {required this.gambar, required this.title, required this.subtitle});
}

class CardItemAvailable {
  final String imagess;
  final String titless;
  final String subtitless;

  const CardItemAvailable(
      {required this.imagess, required this.titless, required this.subtitless});
}

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final List<CardItem> items = [
    CardItem(
      gambar: ('assets/images/hiace.png'),
      title: 'HIACE',
      subtitle: '01 November 2023',
    ),
    CardItem(
      gambar: ('assets/images/veloz.png'),
      title: 'AYLA',
      subtitle: '02 November 2023',
    ),
    CardItem(
      gambar: ('assets/images/brv.png'),
      title: 'BRV',
      subtitle: '23 Oktober 2023',
    ),
    CardItem(
      gambar: ('assets/images/pajero.png'),
      title: 'PAJERO',
      subtitle: '13 Oktober 2023',
    ),
  ];

  final List<CardItemAvailable> itemss = [
    CardItemAvailable(
      imagess: ('assets/images/pajero.png'),
      titless: 'PAJERO',
      subtitless: 'Rp.400.000,-',
    ),
    CardItemAvailable(
      imagess: ('assets/images/brv.png'),
      titless: 'BRV',
      subtitless: 'Rp.350.000,-',
    ),
    CardItemAvailable(
      imagess: ('assets/images/veloz.png'),
      titless: 'AYLA',
      subtitless: 'Rp.250.000,-',
    ),
    CardItemAvailable(
      imagess: ('assets/images/hiace.png'),
      titless: 'HIACE',
      subtitless: 'Rp.600.000,-',
    ),
    CardItemAvailable(
      imagess: ('assets/images/veloz.png'),
      titless: 'VELOZ',
      subtitless: 'Rp.300.000,-',
    ),
    CardItemAvailable(
      imagess: ('assets/images/agya.png'),
      titless: 'AGYA',
      subtitless: 'Rp.300.000,-',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C354B),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Container(
                  child: Text(
                    'Recent Rent',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              //Recent Order
              Container(
                height: 230,
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (context, _) => SizedBox(width: 6),
                  itemBuilder: (context, index) =>
                      buildCard(item: items[index]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                child: Container(
                  child: Text(
                    'Available',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              // Available
              Container(
                margin:
                    EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 20),
                height: 350,
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  separatorBuilder: (context, _) => SizedBox(width: 6),
                  itemBuilder: (context, index) =>
                      buildCards(itemm: itemss[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({required CardItem item}) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            border: Border.all(color: Colors.grey)),
        width: 180,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                  aspectRatio: 4 / 3, child: Image.asset(item.gambar)),
            ),
            const SizedBox(height: 4),
            Column(
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    item.subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildCards({required CardItemAvailable itemm}) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              border: Border.all(color: Colors.grey)),
          width: 350,
          child: Row(
            children: [
              Expanded(
                child: AspectRatio(
                    aspectRatio: 4 / 2, child: Image.asset(itemm.imagess)),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      itemm.titless,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                    Text(
                      itemm.subtitless,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      'Order Now',
                      style: TextStyle(fontSize: 14, color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
