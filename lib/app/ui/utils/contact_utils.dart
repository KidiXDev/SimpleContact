import 'dart:io';

void launchWhatsApp(String phoneNumber) async {
  final url = 'https://wa.me/${phoneNumber.replaceAll(RegExp(r'[^\d+]'), '')}';
  try {
    await Process.run('xdg-open', [url]);
  } catch (e) {
    print('Error: $e');
  }
}

String generateVCard(String name, String phoneNumber) {
  return """
BEGIN:VCARD
VERSION:3.0
N:$name;;;;
TEL:$phoneNumber
END:VCARD
""";
}
