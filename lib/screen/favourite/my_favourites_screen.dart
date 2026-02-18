import 'package:counter_scratch/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavouritesScreen extends StatefulWidget {
  const MyFavouritesScreen({super.key});

  @override
  State<MyFavouritesScreen> createState() => _MyFavouritesScreenState();
}

class _MyFavouritesScreenState extends State<MyFavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    final MyFavouritesProvider = Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyFavouritesScreen()),
              );
            },
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<FavouriteProvider>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.selectedList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedList.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },

                      title: Text("item" + index.toString()),
                      trailing: value.selectedList.contains(index)
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border_outlined),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
