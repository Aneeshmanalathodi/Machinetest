import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:machine_test_lilac/injectable.config.dart';
final getIt = GetIt.instance;
@InjectableInit(    
  initializerName: r'$initGetIt',   
  preferRelativeImports: true,     
  asExtension: false,     
)
void configureInjection() => $initGetIt(getIt);