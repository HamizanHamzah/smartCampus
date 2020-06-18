import 'package:url_launcher/url_launcher.dart';

class UrlHelper {

  UrlHelper._();

  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> openUrlWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(url,forceWebView: true,enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchMap({String lat = "47.6", String long = "-122.3"}) async{
    var mapSchema = 'geo:$lat,$long';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }

  static Future<void> launchCall(String phoneNo) async{
    var phoneSchema = 'tel:$phoneNo';
    if (await canLaunch(phoneSchema)) {
      await launch(phoneSchema);
    } else {
      throw 'Could not launch $phoneSchema';
    }
  }

  static Future<void> launchSms(String phoneNo) async{
    var phoneSchema = 'sms:$phoneNo';
    if (await canLaunch(phoneSchema)) {
      await launch(phoneSchema);
    } else {
      throw 'Could not launch $phoneSchema';
    }
  }
}
