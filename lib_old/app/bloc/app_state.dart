// part of 'app_bloc.dart';

// enum AuthStatus {
//   authenticated,
//   unauthenticated,
// }

// final class AppState extends Equatable {
//   const AppState._({
//     required this.status,
//     this.user = User.empty,
//     this.errorMsg = '',
//     this.isLoading = false,
//     this.connectionError = false,
//     this.isNavigationAddCardToCollection = false,
//   });

//   const AppState.unauthenticated() : this._(status: AuthStatus.unauthenticated);

//   const AppState.authenticated(User user)
//       : this._(status: AuthStatus.authenticated, user: user);

//   final AuthStatus status;
//   final User user;
//   final String errorMsg;
//   final bool isLoading;
//   final bool connectionError;
//   final bool isNavigationAddCardToCollection;

//   AppState copyWith({
//     AuthStatus? status,
//     User? user,
//     String? errorMsg,
//     bool? isLoading,
//     bool? connectionError,
//     bool? isNavigationAddCardToCollection,
//   }) {
//     return AppState._(
//       status: status ?? this.status,
//       user: user ?? this.user,
//       errorMsg: errorMsg ?? this.errorMsg,
//       isLoading: isLoading ?? this.isLoading,
//       connectionError: connectionError ?? this.connectionError,
//       isNavigationAddCardToCollection: isNavigationAddCardToCollection ??
//           this.isNavigationAddCardToCollection,
//     );
//   }

//   @override
//   List<Object> get props => [
//         status,
//         user,
//         errorMsg,
//         isLoading,
//         connectionError,
//         isNavigationAddCardToCollection,
//       ];
// }
