import 'package:flutter/material.dart';
import 'package:fundamental1/restaurant.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/detail';

  final Restaurant restaurant;

  const RestaurantDetail({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child:Text( restaurant.name,
                            style: const TextStyle(
                                fontWeight:FontWeight.bold,fontSize: 40),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rate,
                                size: 32,
                                color: Colors.orange,
                              ),
                              Text(restaurant.rating,
                                style: const TextStyle(
                                    fontWeight:FontWeight.bold,fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.redAccent,
                        size: 20,
                      ),
                      Text(
                        restaurant.city,
                        style: const TextStyle(
                            fontWeight:FontWeight.bold,fontSize: 20),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Text('${restaurant.description}',
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ),
            Divider(
                color: Colors.grey
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.restaurant,
                              size: 20,
                              color: Colors.black,
                            ),
                            Text(
                              ' Daftar Makanan',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: restaurant.menus.foods
                              .map((e) => Text('- ' + e.name))
                              .toList(),
                        )
                      ],
                    ),
                ),
                Expanded(
                    child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.emoji_food_beverage_rounded,
                                size: 16,
                                color: Colors.black,
                              ),
                              Text(
                                ' Daftar Minuman',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: restaurant.menus.drinks
                                .map((e) => Text('- ' + e.name))
                                .toList(),
                          ),
                        ],
                    ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
