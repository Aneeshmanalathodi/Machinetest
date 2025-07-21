import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final int otp;
  final String message;

  const OtpSuccess(this.otp, this.message);

  @override
  List<Object> get props => [otp, message];
}

class OtpFailure extends OtpState {
  final String error;

  const OtpFailure(this.error);

  @override
  List<Object> get props => [error];
}