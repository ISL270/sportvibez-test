import 'package:go_router/go_router.dart';
import 'package:sportvibez_test/ui/views/contacts/contacts_view.dart';
import 'package:sportvibez_test/ui/views/startup/startup_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartupView(),
    ),
    GoRoute(
      path: ContactsView.route,
      builder: (context, state) => const ContactsView(),
    ),
  ],
);
