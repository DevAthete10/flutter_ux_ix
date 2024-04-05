import 'package:flutter/material.dart';

import 'package:flutter_full_ux_ix/1.Presentation/pages/index_page.dart';

Map<String,Widget Function(BuildContext)> routes = {
  "menu":(_) => const MenuPage(),
  "list_item":(_) =>  const ListItemPage(),
  // Materil kit
  "simple_appbar":(_) => const SimpleAppBarPage(),
  "sliver_appbar":(_) => const SliverAppBarPage(),
  "appbar_1_concept":(_) => const AppBar1ConceptPage(),
  "dropdown_1_concept":(_) => const DropDown1ConceptPage(),
  "navigatorbar_1_concept":(_) => const NavigatorBar1ConceptPage(),
  "navigatorbar_2_concept":(_) => const NavigatorBar2ConceptPage(),
  "grid_1_concept":(_) => const Grid1ConceptPage(),
  "grid_2_concept":(_) => const Grid2ConceptPage(),
  // ----- ------
  // List Animation
  "drawer_animation":(_) => const DrawerAnimationPage(),
  "list_1_concept":(_) => const List1ConceptPage(),
  // ----- ------
  // Integration
  "http":(_) => const HttpPage(),
  "dio":(_) => const DioPage(),
  "sqlite":(_) => const SqlitePage(),
  "realtime_database_dio":(_) => const RealtimeDatabaseDioPage(),
  "firestore":(_) => FirestorePage(),
  "youtube":(_) => const YoutubePage(),
  "ft_chart":(_) => const ChartsPage(),
  "notification_local":(_) => const NotificationLocalPage(),
  "isar":(_) => const IsarPage(),
  "google_sign":(_) => const GoogleSignPage(),
  // ----- ------
  // Full Application
  "uber":(_) => const UberPage(),
  "whatsapp":(_) => const WhatsAppPage(),
  "myfitnesspal":(_) => const MyFitnessPalPage(),
  "drivvo":(_) => const DrivvoPage(),
  "detail_vehiculo_drivvo":(_) => const DetailVehiculoPage(),
  // ----- ------
  // Ui screen
  "login":(_) => const Login1Page(),
  "onboarding_1_concept":(_) => const Onboarding1ConceptPage(),
  "error_1_concept":(_) => const Error1Page(),
  // ----- ------
};

