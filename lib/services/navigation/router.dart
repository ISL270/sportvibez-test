import 'package:go_router/go_router.dart';
import 'package:sportvibez_test/app/domain_models/contact.dart';
import 'package:sportvibez_test/ui/views/contact_details/contact_details_view.dart';
import 'package:sportvibez_test/ui/views/contacts/contacts_view.dart';
import 'package:sportvibez_test/ui/views/startup/startup_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: 'startup',
      path: '/',
      builder: (context, state) => const StartupView(),
      routes: [
        GoRoute(
          name: ContactsView.routeName,
          path: ContactsView.routeName,
          builder: (context, state) => const ContactsView(),
          routes: [
            GoRoute(
              name: ContactDetailsView.routeName,
              path: ContactDetailsView.routeName,
              builder: (context, state) {
                final contact = state.extra as Contact;
                return ContactDetailsView(contact);
              },
            )
          ],
        ),
      ],
    ),
  ],
);

void clearAndNavigate(String name) {
  while (router.canPop() == true) {
    router.pop();
  }
  router.pushReplacementNamed(name);
}
