part of 'card_search_bloc.dart';

sealed class CardSearchState extends Equatable {
  const CardSearchState();
  
  @override
  List<Object> get props => [];
}

final class CardSearchInitial extends CardSearchState {}
