part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.user,
    this.status = RequestStatus.noSubmitted,
    this.mssg = 'sin solicitud',
  });

  const AuthState.inProgress({
    this.user,
    this.mssg = 'solicitud en progreso',
  }) : status = RequestStatus.inProgress;

  const AuthState.failed({
    this.user,
    this.mssg = 'error en la solicitud',
  }) : status = RequestStatus.failed;

  final UserModel? user;
  final RequestStatus? status;
  final String? mssg;

  @override
  List<Object?> get props => [
        status,
        mssg,
        user,
      ];
}

class Authenticated extends AuthState {
  const Authenticated(UserModel? user)
      : super(
          user: user,
          mssg: 'solicitud en progreso',
          status: RequestStatus.success,
        );
  @override
  List<Object?> get props => [
        status,
        mssg,
        user,
      ];
}

class Unauthenticated extends AuthState {
  const Unauthenticated()
      : super(
          user: null,
          mssg: 'sin solicitud',
          status: RequestStatus.noSubmitted,
        );
  @override
  List<Object?> get props => [
        status,
        mssg,
        user,
      ];
}
