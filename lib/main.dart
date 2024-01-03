import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_checker/bloc/internet_bloc.dart';
import 'package:internet_connectivity_checker/screen/homePage.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context)=> InternetBloc(),
     child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
     ),
      
      
    );
    
  }
}