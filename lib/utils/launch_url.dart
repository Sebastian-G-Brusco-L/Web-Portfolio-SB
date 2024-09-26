import 'package:url_launcher/url_launcher.dart';

Future<void> launchURLCustom(String url) async {
  final Uri uri =
      Uri.parse(url); // Utiliza Uri.parse para construir correctamente la URL
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw "No se pudo abrir el enlace";
  }
}
