import 'package:flutter/material.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/ui/views/contact_details/contact_details_view.dart';
import 'package:sportvibez_test/ui/views/contact_details/contact_view_response.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  final Function(ContactViewResponse res) onActionTaken;

  const ContactTile({
    super.key,
    required this.contact,
    required this.onActionTaken,
  });

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
      onTap: () async {
        final res = await ContactDetailsView.route(context, contact);
        if (res == null) return;
        onActionTaken.call(res);
      },
    );
  }
}
