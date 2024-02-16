import 'package:flutter/material.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  const ContactTile(this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      title: Text(
        '${contact.firstName} ${contact.lastName}',
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade800,
        ),
      ),
      subtitle: Text(
        contact.phoneNumber,
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
