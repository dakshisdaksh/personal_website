import 'package:flutter/material.dart';
import 'package:personal_website/pages/homepage/home_page.dart';
import 'package:personal_website/providers/theme_provider.dart';
import 'package:personal_website/providers/utility_provider.dart';
import 'package:personal_website/utilities/strings.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UtilityProvider>(create: (_) => UtilityProvider()),
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider())
  ], child: PortfolioApp()));
}

class PortfolioApp extends StatefulWidget {
  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        title: kTitle,
        theme: themeProvider.getTheme,
        home: Scaffold(
            body: Scrollbar(radius: Radius.circular(12), child: HomePage())));
  }
}
