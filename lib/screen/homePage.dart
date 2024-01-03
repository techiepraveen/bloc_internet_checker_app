import 'package:flutter/material.dart';
 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_checker/bloc/internet_bloc.dart';
import 'package:internet_connectivity_checker/bloc/internet_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            
           listener: (context, state){
              if(state is InternetGainedState){
                ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar
                (content: Text("Intenet connected"),
                backgroundColor: Colors.green,
                ));
              }
              else if(state is InternetLostState){
                 ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar
                (content: Text("Not connected"),
                backgroundColor: Colors.red,
                ));
              }
              else{
                 ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar
                (content: Text("Loading ......"),
                backgroundColor: Colors.blue,
                ));
          
              }
             },
             builder:(context, state){
              if(state is InternetGainedState){
              
               return const Text("connected");
              }
              else if(state is InternetLostState){
                return const Text("Not Connected");
              }
              else{
                return const Text("Loading....");
              }
            },
             ),
        ),
      ),
    );
  }
}