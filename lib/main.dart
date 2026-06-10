import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/store_provider.dart';
import 'screens/main_wrapper.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StoreProvider(),
      child: const CommerceApplication(),
    ),
  );
}

class CommerceApplication extends StatelessWidget {
  const CommerceApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Solution',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F9FA),
        primarySwatch: Colors.indigo,
        useMaterial3: false,
      ),
      home: const MainWrapper(),
    );
  }
}