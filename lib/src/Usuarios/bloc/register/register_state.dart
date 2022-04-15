part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.user,
    this.status = RequestStatus.noSubmitted,
    this.mssg = 'sin solicitud',
  });

  const RegisterState.success({
    this.user,
    this.mssg = 'solicitud exitosa',
  }) : status = RequestStatus.success;

  const RegisterState.inProgress({
    this.user,
    this.mssg = 'solicitud en progreso',
  }) : status = RequestStatus.inProgress;

  const RegisterState.failed({
    this.user,
    this.mssg = 'error en la solicitud',
  }) : status = RequestStatus.failed;

  final UserModel? user;
  final RequestStatus status;
  final String mssg;

  @override
  List get props => [
        status,
        mssg,
        user,
      ];
}
