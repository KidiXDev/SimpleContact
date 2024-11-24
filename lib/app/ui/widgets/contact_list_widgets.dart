import 'dart:io';

import 'package:aplikasi_kontak_sqflite/app/routes/pages_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/contact_model.dart';
import '../../data/providers/contact_provider.dart';
import '../theme/theme.dart';

class ContactListWidgets extends StatelessWidget {
  const ContactListWidgets({
    super.key,
    required this.contacts,
  });

  final ContactModel contacts;

  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);
    return Card(
      elevation: 5,
      color: Colors.teal[500],
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RoutesName.contactDetailPage, arguments: contacts)
              .then((value) {
            if (value != null) {
              // add delay
              Future.delayed(const Duration(milliseconds: 500), () {
                contactProvider.deleteContact(value as int);
              });
            }
          });
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: contacts.image != null
                ? FileImage(File(contacts.image!))
                : null,
            child: contacts.image == null ? const Icon(Icons.person) : null,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          title: Text(
            contacts.name,
            style: ThemeApp.basicTextStyle,
          ),
          subtitle: Text(
            contacts.phoneNumber,
            style: ThemeApp.basicTextStyle,
          ),
        ),
      ),
    );
  }
}
