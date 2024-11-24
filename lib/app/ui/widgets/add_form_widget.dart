import 'package:flutter/material.dart';

import '../../controllers/contact_controller.dart';

class AddFormWidget extends StatelessWidget {
  const AddFormWidget({
    super.key,
    required ContactController controller,
  }) : _controller = controller;

  final ContactController _controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          TextFormField(
            controller: _controller.nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _controller.phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _controller.emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _controller.companyController,
            decoration: const InputDecoration(
              labelText: 'Company name',
              hintText: 'Enter your Company name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Company name';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
