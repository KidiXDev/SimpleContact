import 'package:flutter/material.dart';

import '../../controllers/contact_controller.dart';
import '../theme/theme.dart';
import '../widgets/contact_form_widget.dart';
import '../widgets/image_picker_widget.dart';
import '../widgets/navigation_bar_save_button_widget.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final ContactController _controller = ContactController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: ThemeApp.scaffoldColor,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: ThemeApp.appBarColor,
          title: const Text('Add Contact'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ImagePickerWidget(
                  currentImage: _controller.image,
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
              _controller.addContact(context).then((_) {
                Navigator.of(context).pop(true);
              });
            }
          },
        ),
      ),
    );
  }
}
