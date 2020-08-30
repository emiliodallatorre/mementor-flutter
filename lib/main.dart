import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mementor/generated/l10n.dart';
import 'package:mementor/interface/screen/create_record_screen.dart';
import 'package:mementor/interface/screen/home_screen.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(Mementor());
}

class Mementor extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mementor',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.white,
        fontFamily: "NotoSerif",
        buttonTheme: ButtonThemeData(buttonColor: Colors.amberAccent),
        inputDecorationTheme: InputDecorationTheme(focusedBorder: UnderlineInputBorder()),
      ),
      home: HomeScreen(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routes: <String, Widget Function(BuildContext)>{
        HomeScreen.route: (BuildContext context) => HomeScreen(),
        CreateRecordScreen.route: (BuildContext context) => CreateRecordScreen(),
      },
    );
  }
}
