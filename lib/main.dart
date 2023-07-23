import 'dart:html' as html;
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mac_dt/configuration/app_configuration.dart';
import 'package:mac_dt/data/system_data.dart';
import 'package:mac_dt/data/system_data_CRUD.dart';
import 'package:mac_dt/features/desktop/data/wallpaper/wallpaper.dart';
import 'package:mac_dt/utils/provider/data_bus_provider.dart';
import 'package:mac_dt/utils/firebase/firebase_client.dart';
import 'package:mac_dt/utils/provider/folders_provider.dart';
import 'package:mac_dt/utils/provider/on_off_provider.dart';
import 'package:provider/provider.dart';

import 'configuration/theme.dart';
import 'data/analytics.dart';
import 'features/desktop/presentation/views/desktop.dart';
import 'utils/provider/apps_provider.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(SystemDataCRUD.getTheme()), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OnOff>(
          create: (context) => OnOff(),
        ),
        ChangeNotifierProvider<DataBus>(
          create: (context) => DataBus(),
        ),
        ChangeNotifierProvider<Apps>(
          create: (context) => Apps(),
        ),
        ChangeNotifierProvider<Folders>(
          create: (context) => Folders(),
        ),
        ChangeNotifierProvider<AnalyticsService>(
          create: (context) => AnalyticsService(),
        ),
      ],
      child: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        Provider.of<AnalyticsService>(context, listen: false)
            .getAnalyticsObserver()
      ],
      theme: themeNotifier.getTheme(),
      home: MacOS(),
    );
  }
}

