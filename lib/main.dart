import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fundamental1/detail.dart';
import 'package:fundamental1/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RestaurantList.routeName,
      routes: {
        RestaurantList.routeName: (context) => RestaurantList(),
        RestaurantDetail.routeName: (context) => RestaurantDetail(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        ),
      },
    );
  }
}

class RestaurantList extends StatelessWidget {
  static const routeName = '/restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurant')),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.data !=null){
          }else{
            return CircularProgressIndicator();
          }
          var jsonMap = jsonDecode(snapshot.data!);
          var restaurant = HiRestaurant.fromJson(jsonMap);
          return ListView.builder(
            itemCount: restaurant.restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(
                  context, restaurant.restaurants[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RestaurantDetail.routeName,
            arguments: restaurant);
        },
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.network(restaurant.pictureId, height: 100,),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                          size: 18,
                        ),
                        Text(
                          restaurant.city,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 10
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Icon(
                          Icons.star_rate,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Text(restaurant.rating)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
