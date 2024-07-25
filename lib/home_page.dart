import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
                bloc: counterCubit,
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterCubit.increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => counterCubit.decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}

/* notas

- originalmente, o gerenciador do estado do counter era:

int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

para aplicar o cubit/bloc, ele é removido.

-  return BlocBuilder<CounterCubit, int>(
      bloc: counterCubit,
      builder: (context, counter) {...

  para que o estado seja atualizado no ui, é preciso que se tenha um listener que 
  receba a atualização do emit. o blocbuilder faz isso e como o setstate atualiza toda
  a ui. para isso, envolve todo o widget com o blocbuilder e fornece para o builder
  o contexto e o estado.

  o bloc é o counterCubit, pois o cubit por implementar e extender do bloc também pode ser usado.

  é importante que se determine o tipo do bloc e do valor do estado entre <>.

  obs.: o blocbuilder é só aplicado no text, pois sempre que o estado for alterado
  o que estiver retornando do blocbuilder vai ser ser rebuildado. então para não
  rebuildar toda a tela (caso envolvesse o scaffold), envolve apenas onde o estado
  vai ser utilizado 

 */