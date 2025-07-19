const _kBaseURI = "https://test.myfliqapp.com/api/v1";
class ApiEndPoints{
  static const checkOTP = "$_kBaseURI/auth/registration-otp-codes/actions/phone/send-otp"; 
  static const verifyOTP = "$_kBaseURI/auth/registration-otp-codes/actions/phone/verify-otp"; 
  static const getChatProfile = "$_kBaseURI/chat/chat-messages/queries/contact-users"; 
  static const getChatMessagebetweenUser ="$_kBaseURI/chat/chat-messages/queries/chat-between-users/55/81";

}