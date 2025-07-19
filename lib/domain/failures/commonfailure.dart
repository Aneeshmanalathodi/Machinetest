
import 'package:freezed_annotation/freezed_annotation.dart';
part 'commonfailure.freezed.dart';

@freezed
class CommonFailure with _$CommonFailure{
  const factory CommonFailure.clientfailure() = _Clientfailure;
  const factory CommonFailure.serverfailure() = _Serverfailure;
}