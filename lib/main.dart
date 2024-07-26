import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

/* notas:
- provider: fornece a instância da classe CounterCubit para que seja possível acessá-lo
em qualquer lugar no app. 
para isso, no main, wrap o materialapp com o provider e fornece a instância.

blocprovider: utilizado para fornecer uma instância de bloc de uma página para outra.
só aceita blocs/cubits.
*/