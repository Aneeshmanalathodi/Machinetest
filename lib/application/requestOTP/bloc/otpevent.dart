import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class RequestOtpEvent extends OtpEvent {
  final String phoneNumber;

  const RequestOtpEvent(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}