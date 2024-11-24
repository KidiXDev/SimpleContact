import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/contact_model.dart';
import '../data/providers/contact_provider.dart';

class ContactController {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? image;

  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get emailController => _emailController;
  TextEditingController get companyController => _companyController;
  GlobalKey<FormState> get formKey => _formKey;

  void initialize(ContactModel contact) {
    _nameController.text = contact.name;
    _phoneController.text = contact.phoneNumber;
    _emailController.text = contact.email;
    _companyController.text = contact.company;
  }

  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _companyController.dispose();
  }

  Future<void> addContact(BuildContext context) async {
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);

    if (!_validatePhoneNumber()) {
      throw Exception('Phone number must contain only numbers');
    }

    await contactProvider.addContact(
      ContactModel(
        name: _nameController.text,
        phoneNumber: _phoneController.text,
        email: _emailController.text,
        company: _companyController.text,
        image: image?.path,
      ),
    );
  }

  Future<void> updateContact(BuildContext context, ContactModel contact) async {
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);

    if (!_validatePhoneNumber()) {
      throw Exception('Phone number must contain only numbers');
    }

    await contactProvider.updateContact(
      contact.copyWith(
        name: _nameController.text,
        phoneNumber: _phoneController.text,
        email: _emailController.text,
        company: _companyController.text,
        image: image?.path ?? contact.image,
      ),
    );
  }

  bool _validatePhoneNumber() {
    return RegExp(r'^[0-9]+$').hasMatch(_phoneController.text);
  }
}
