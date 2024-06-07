import 'package:clini_dor/pages/home_page.dart';
import 'package:clini_dor/pages/patient/patients_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage()
    ),
    GoRoute(
      path: '/patients',
      builder: (context, state) => const PatientsPage()
    )
  ]
);