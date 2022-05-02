import 'package:url_launcher/url_launcher.dart';

openUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    // can't launch url, there is some error
    throw "Could not launch $url";
  }
}
