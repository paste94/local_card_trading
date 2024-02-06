part of 'buy_bloc.dart';

sealed class BuyState extends Equatable {
  const BuyState();
  
  @override
  List<Object> get props => [];
}

final class BuyInitial extends BuyState {}
