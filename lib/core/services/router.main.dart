part of 'router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) {
        return SplashScreen();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Dashboard(state: state, child: child);
      },
      routes: [
        GoRoute(
          path: HomeView.path,
          builder: (_, __) {
            return const HomeView();
          },
        ),
        GoRoute(
          path: NewGameScreen.path,
          builder: (_, __) {
            return const NewGameScreen();
          },
        ),
        GoRoute(
          path: GamePointsView.path,
           builder: (_, __) {
          return const GamePointsView();
        })
      ],
    ),
  ],
);
