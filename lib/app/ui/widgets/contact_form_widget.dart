import 'package:flutter/material.dart';
import '../../controllers/contact_controller.dart';

class ContactFormWidget extends StatelessWidget {
  final ContactController controller;

  const ContactFormWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          TextFormField(
            controller: controller.nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
            ),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter a name' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
            ),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter a phone number' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your Email',
            ),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter an Email' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller.companyController,
            decoration: const InputDecoration(
              labelText: 'Company name',
              hintText: 'Enter your Company name',
            ),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Please enter a Company name' : null,
          ),
        ],
      ),
    );
  }
}
