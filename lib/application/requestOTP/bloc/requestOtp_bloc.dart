import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:machine_test_lilac/application/requestOTP/bloc/otpevent.dart';
import 'package:machine_test_lilac/application/requestOTP/bloc/otpstate.dart';
import 'package:http/http.dart' as http;

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final String baseUrl;

  OtpBloc({required this.baseUrl}) : super(OtpInitial()) {
    on<RequestOtpEvent>(_onRequestOtp);
  }

  Future<void> _onRequestOtp(RequestOtpEvent event, Emitter<OtpState> emit) async {
    emit(OtpLoading());

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/registration-otp-codes/actions/phone/send-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'data': {
            'type': 'registration_otp_codes',
            'attributes': {
              'phone': event.phoneNumber,
            },
          },
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        emit(OtpSuccess(
          responseData['data'] as int,
          responseData['message'] as String,
        ));
      } else {
        emit(const OtpFailure('Failed to request OTP'));
      }
    } catch (e) {
      emit(OtpFailure(e.toString()));
    }
  }
}