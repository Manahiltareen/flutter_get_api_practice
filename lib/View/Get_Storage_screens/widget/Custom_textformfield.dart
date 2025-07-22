import 'package:flutter/material.dart';

enum ValidatorType { email, number, name }

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData icon;
  final TextEditingController controller;
  final ValidatorType validatorType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.hint,
    required this.validatorType,
  });

  String? _validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your $label';
    }

    switch (validatorType) {
      case ValidatorType.email:
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        break;
      case ValidatorType.number:
        if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
          return 'Please enter a valid number (10-15 digits)';
        }
        break;
      case ValidatorType.name:
        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
          return 'Name should only contain letters';
        }
        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.lightBlue,
          fontWeight: FontWeight.bold,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.lightBlue),
        filled: true,
        fillColor: Colors.lightBlue.shade50,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.lightBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: _validate,
    );
  }
}
