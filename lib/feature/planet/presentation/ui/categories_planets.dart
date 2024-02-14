import 'package:books_api/core/route/router.dart';
import 'package:books_api/core/route/router_utils.dart';
import 'package:flutter/material.dart';

class CategoriesPlanets extends StatefulWidget {
  const CategoriesPlanets({super.key});

  @override
  State<CategoriesPlanets> createState() => _CategoriesPlanetsState();
}

class _CategoriesPlanetsState extends State<CategoriesPlanets> {
  List<String> categories = [
    'min temp',
    'min radius',
    'min mass' // add more filter categories
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(50, 237, 150, 189),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                trailing: const Icon(Icons.chevron_right),
                title: Text(
                  categories[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  router.push(Pages.filteredCategory.screenPath,
                      extra: categories[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
