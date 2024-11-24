import 'dart:io';

import 'package:aplikasi_kontak_sqflite/app/data/models/contact_model.dart';
import 'package:aplikasi_kontak_sqflite/app/routes/pages_route.dart';
import 'package:aplikasi_kontak_sqflite/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import '../../data/providers/contact_provider.dart';
import '../widgets/contact_info_widget.dart';
import '../utils/contact_utils.dart';

class ContactDetailPage extends StatelessWidget {
  final ContactModel contact;
  const ContactDetailPage({required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    final selectedContact = Provider.of<ContactProvider>(context)
        .contacts
        .firstWhere((element) => element.id == contact.id);
    return Scaffold(
      backgroundColor: ThemeApp.scaffoldColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: ThemeApp.appBarColor,
        title: const Text('Contact Detail'),
        actions: [
          IconButton(
              onPressed: () {
                // Delete contact
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Contact'),
                    content: const Text(
                        'Are you sure you want to delete this contact?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context, selectedContact.id);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.delete,
              )),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RoutesName.editContactPage,
                arguments: selectedContact,
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: selectedContact.image != null
                          ? FileImage(File(selectedContact.image!))
                          : null,
                      child: selectedContact.image == null
                          ? const Icon(Icons.person, size: 50)
                          : null,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      selectedContact.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                color: ThemeApp.appBarColor,
              ),
              const SizedBox(height: 10),
              ContactInfoContainer(
                children: [
                  ContactInfoItem(
                    icon: Icons.phone,
                    text: selectedContact.phoneNumber,
                  ),
                  const SizedBox(height: 10),
                  ContactInfoItem(
                    icon: Icons.email,
                    text: selectedContact.email,
                  ),
                  const SizedBox(height: 10),
                  ContactInfoItem(
                    icon: Icons.business,
                    text: selectedContact.company,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                color: ThemeApp.appBarColor,
              ),
              const SizedBox(height: 10),
              ContactInfoContainer(
                children: [
                  InkWell(
                    onTap: () {
                      if (Platform.isAndroid || Platform.isIOS) {
                        launchWhatsApp(selectedContact.phoneNumber);
                      }
                    },
                    child: const ContactInfoItem(
                      icon: Icons.phone,
                      text: 'WhatsApp',
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      _showQRCodeBottomSheet(
                          context, selectedContact.phoneNumber);
                    },
                    child: const ContactInfoItem(
                      icon: Icons.qr_code_2_rounded,
                      text: 'QR Code',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showQRCodeBottomSheet(BuildContext context, String phoneNumber) {
    var num = PhoneNumber.parse(phoneNumber, destinationCountry: IsoCode.ID);

    String vCard = generateVCard(contact.name, num.international);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: Center(
            child: QrImageView(
              data: vCard,
              version: QrVersions.auto,
              size: 200,
            ),
          ),
        );
      },
    );
  }
}
