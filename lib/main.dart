import 'package:aqar_map/packages/aqar_map_api/lib/aqar_map_api.dart';
import 'package:aqar_map/packages/movie_repository/lib/movie_repository.dart';
import 'package:aqar_map/routing_table.dart';
import 'package:flutter/material.dart';

import 'package:routemaster/routemaster.dart';

void main() async {
  runApp(
    const AqarMap(),
  );
}

class AqarMap extends StatefulWidget {
  const AqarMap({
    Key? key,
  }) : super(key: key);

  @override
  AqarMapState createState() => AqarMapState();
}

class AqarMapState extends State<AqarMap> {
  late final dynamic _aqarMapApi = AqarMapApi();

  late final dynamic _movieRepository = MovieRepository(
    remoteApi: _aqarMapApi,
  );

  late final RoutemasterDelegate _routerDelegate = RoutemasterDelegate(
    routesBuilder: (context) {
      return RouteMap(
        routes: buildRoutingTable(
          routerDelegate: _routerDelegate,
          movieRepository: _movieRepository,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        inputDecorationTheme:
            const InputDecorationTheme(border: OutlineInputBorder()),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            shadowColor: Colors.transparent),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.blue,
        ),
        sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noThumb,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: _routerDelegate,
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
