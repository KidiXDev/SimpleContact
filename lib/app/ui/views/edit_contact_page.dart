import 'dart:io';

import 'package:flutter/material.dart';

import '../../controllers/contact_controller.dart';
import '../../data/models/contact_model.dart';
import '../theme/theme.dart';
import '../widgets/contact_form_widget.dart';
import '../widgets/image_picker_widget.dart';
import '../widgets/navigation_bar_save_button_widget.dart';

class EditContactPage extends StatefulWidget {
  final ContactModel contact;
  const EditContactPage({required this.contact, super.key});

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  final ContactController _controller = ContactController();

  @override
  void initState() {
    super.initState();
    _controller.initialize(widget.contact);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            return;
          }
          final shouldPop = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Discard Changes?'),
                  content:
                      const Text('Are you sure you want to discard changes?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Discard'),
                    ),
                  ],
                ),
              ) ??
              false;

          if (context.mounted && shouldPop) {
            Navigator.pop(context, result);
          }
        },
        child: Scaffold(
          backgroundColor: ThemeApp.scaffoldColor,
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: ThemeApp.appBarColor,
            title: const Text('Edit Contact'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ImagePickerWidget(
                    currentImage: _controller.image ??
                        (widget.contact.image != null
                            ? File(widget.contact.image!)
                            : null),
                    onImageSelected: (file) =>
                        setState(() => _controller.image = file),
                  ),
                  ContactFormWidget(controller: _controller),
                ],
              ),
            ),
          ),
          bottomNavigationBar: NavigationBarSaveButtonWidget(
            onPressed: () async {
              if (_controller.formKey.currentState!.validate()) {
                _controller.updateContact(context, widget.contact).then((_) {
                  Navigator.of(context).pop(true);
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
