import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/database/moorDB.dart';
import 'package:weathery/utils/providers.dart';
import 'package:weathery/utils/repository.dart';
import 'package:weathery/views/weather_details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CitySearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.backspace_rounded),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_rounded),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, null);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) =>  FutureBuilder(
        future: loadJsonAsset(),
        builder: (context, AsyncSnapshot<String> city) {
          if (!city.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<dynamic> decodedJson = jsonDecode(city.data);
          final searchList = query.isEmpty
              ? decodedJson
              : decodedJson
                  .where((element) => element['name'].contains(query.replaceFirst(
                      RegExp(query[0]), query[0].toUpperCase())))
                  .toList();
          return ListView.builder(
            itemCount: searchList.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.location_city_rounded),
              title: RichText(
                text: TextSpan(
                  text:
                      '${searchList[index]['name']}, ${searchList[index]['country']}'
                          .substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 55.sp),
                  children: [
                    TextSpan(
                      text:
                          '${searchList[index]['name']}, ${searchList[index]['country']}'
                              .substring(query.length),
                      style: TextStyle(color: Colors.grey[800], fontSize: 55.sp),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                Repository repo = watch(repoProvider);
                Weather weather = await repo.fetchCityWeather(
                    searchList[index]['coord']['lat'],
                    searchList[index]['coord']['lon']);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => WeatherDetailsScreen(
                          weather: weather,
                          fromProvider: StateProvider<bool>((ref) => true),
                        )));
              },
            ),
          );
        },
      ),
    );
  }

  Future<String> loadJsonAsset() async =>
      await rootBundle.loadString('assets/data/city.list.json');
}
