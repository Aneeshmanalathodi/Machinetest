// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:machine_test_lilac/application/requestOTP/bloc/requestOtp_bloc.dart';
// import 'package:machine_test_lilac/presentation/otp.dart';

// class Phonenumber extends StatelessWidget {
//    Phonenumber({super.key});
// final otpBloc = OtpBloc(baseUrl: 'https://your-api-base-url.com');
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Enter your phone number',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.brown,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               // controller: _phoneController,
//               keyboardType: TextInputType.phone,

//               decoration: InputDecoration(
//                 hintText: '+91 | Enter your phone number',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Fliq will send you a text with a verification code.',
//               style: TextStyle(color: Colors.grey,fontSize: 12),
//             ),
//             Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Otpscreen()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),backgroundColor: Colors.pink
//               ),
//               child: Text(
//                 'Next',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_lilac/application/requestOTP/bloc/otpevent.dart';
import 'package:machine_test_lilac/application/requestOTP/bloc/otpstate.dart';
import 'package:machine_test_lilac/application/requestOTP/bloc/requestOtp_bloc.dart';
import 'package:machine_test_lilac/presentation/otp.dart';

class Phonenumber extends StatelessWidget {
  Phonenumber({super.key});

  final TextEditingController _phoneController = TextEditingController();
  final String baseUrl = 'https://test.myfliqapp.com/api/v1';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpBloc(baseUrl: baseUrl),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<OtpBloc, OtpState>(
            listener: (context, state) {
              if (state is OtpSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Otpscreen(
                      phoneNumber: _phoneController.text,
                    ),
                  ),
                );
              } else if (state is OtpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.error}')),
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter your phone number',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: '+91 | Enter your phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Fliq will send you a text with a verification code.',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: state is OtpLoading
                        ? null
                        : () {
                            final phoneNumber = _phoneController.text.trim();
                            if (phoneNumber.isNotEmpty) {
                              context
                                  .read<OtpBloc>()
                                  .add(RequestOtpEvent('+918087808780'));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Please enter a phone number')),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.pink,
                    ),
                    child: state is OtpLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
