import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state == 0) {
      return;
    }
    emit(state - 1);
  }
}

/* notas:
- a classe Cubit estende e é muito similar ao Bloc, porém sem possuir a noção dos eventos
e dependendo de métodos para emitir ('emit') novos estados.

Observação: emit é uma função protegida, ou seja não pode ser usada fora da classe Cubit

Cubit requer um construtor, cujo valor tem que ser passado da child classe para parent
class. Ou seja, tem que se passar o valor do CounterCubit (filha) para o Cubit (pai):

abstract class Cubit<State> extends BlocBase<State> {
  /// {@macro cubit}
  Cubit(State initialState) : super(initialState);
}

'initialState' é o valor que deve ser passado, e será este o estado antes que métodos sejam
emitidos para mudar o estado. o initialState pode ser qualquer tipo de dado que se deseja,
desde Strings, números e até mesmo classe. Porém, quando se determina o valor dentro
do genérico de <>, tem que seguir o informado.

no caso, o initialState será 0 pois é o valor que o counter tem sempre que reiniciar o app.

- para passar o valor para a classe pai:

CounterCubit() : super(0); 
-> cria o construtor (countercubit) 
-> chama o super -> chama a super class (Cubit)
-> passa o valor para o construtor da super (0)

- a função de incremento criada utiliza o método emit, que irá notificar todos os listener
que o counter teve seu estado alterado e que é necessário atualizar o ui

- void decrement() {
    if (state == 0){
      return;
    }

 impede que o valor siga abaixo de zero. assim que o estado é igual a 0, retorna nada e
 simplesmente para. enquanto essa condição não é satisfeita, o decrement continua
 */
