import 'package:dartz/dartz.dart';
import 'package:machine_test_lilac/domain/failures/commonfailure.dart';
import 'package:machine_test_lilac/domain/model/requestOTP.dart';

abstract class IrequestOTP{
  Future<Either<CommonFailure,RequestOTP>>postrequestotp();
} 