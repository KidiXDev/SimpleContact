import 'package:aplikasi_kontak_sqflite/app/ui/views/contact_detail_page.dart';
import 'package:aplikasi_kontak_sqflite/app/ui/views/edit_contact_page.dart';

import '../data/models/contact_model.dart';
import 'custom_page_route.dart';
import 'pages_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/add_contact_page.dart';
import '../ui/views/home_screen_page.dart';

class Pages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homePage:
        return CustomPageRoute(
          page: const HomePages(),
          begin: const Offset(-1.0, 0.0),
        );
      case RoutesName.addContactPage:
        return CustomPageRoute(
          page: const AddContactPage(),
          begin: const Offset(0.0, 1.0),
        );
      case RoutesName.contactDetailPage:
        var contact = settings.arguments as ContactModel;
        return CustomPageRoute(
          page: ContactDetailPage(
            contact: contact,
          ),
          begin: const Offset(0.0, 1.0),
        );
      case RoutesName.editContactPage:
        var contact = settings.arguments as ContactModel;
        return CustomPageRoute(
          page: EditContactPage(
            contact: contact,
          ),
          begin: const Offset(-1.0, 0.0),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 80, color: Colors.red),
                  const SizedBox(height: 20),
                  const Text(
                    '404',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Page Not Found',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // ignore: no_wildcard_variable_uses
                      Navigator.of(_).pushNamed(RoutesName.homePage);
                    },
                    child: const Text('Go to Home Page'),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
