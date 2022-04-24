import 'package:url_launcher/url_launcher.dart';

class CallService {
  static void call(String number) => launchUrl(Uri.parse("tel:$number"));
  static void sendSms(String number) => launchUrl(Uri.parse("sms:$number"));
  static void sendEmail(String email) => launchUrl(Uri.parse("mailto:$email"));
}
