import 'package:url_launcher/url_launcher.dart';

class CallService {
  static void call(String number) => launch("tel:$number");
  static void sendSms(String number) => launch("sms:$number");
  static void sendEmail(String email) => launch("mailto:$email");
}