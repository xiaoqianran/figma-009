import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/notification/presentation/screens/notification_screens.dart';
import 'package:figma_009/features/onboarding/presentation/screens/onboarding_screens.dart';
import 'package:figma_009/features/settings/presentation/screens/settings_screens.dart';
import 'package:figma_009/features/token/presentation/screens/token_screens.dart';
import 'package:figma_009/features/transaction/presentation/screens/transaction_screens.dart';
import 'package:figma_009/features/wallet/presentation/screens/wallet_screens.dart';
import 'package:figma_009/shared/layouts/main_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.seedPhrase,
        builder: (context, state) => const SeedPhraseScreen(),
      ),
      GoRoute(
        path: AppRoutes.recovery,
        builder: (context, state) => const RecoveryScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.wallet,
                builder: (context, state) => const WalletScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'scroll',
                    builder: (context, state) => const WalletScrollScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.swap,
                builder: (context, state) => const SwapScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.notification,
                builder: (context, state) => const NotificationScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.settings,
                builder: (context, state) => const SettingsScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'wallet',
                    builder: (context, state) => const SettingsWalletScreen(),
                  ),
                  GoRoute(
                    path: 'input',
                    builder: (context, state) => const SettingsInputScreen(),
                  ),
                  GoRoute(
                    path: 'slide',
                    builder: (context, state) => const SettingsSlideScreen(),
                  ),
                  GoRoute(
                    path: 'security',
                    builder: (context, state) => const SettingsSecurityScreen(),
                    routes: <RouteBase>[
                      GoRoute(
                        path: 'passcode',
                        builder: (context, state) =>
                            const SettingsPasscodeScreen(),
                      ),
                      GoRoute(
                        path: 'autolock',
                        builder: (context, state) =>
                            const SettingsAutoLockScreen(),
                      ),
                      GoRoute(
                        path: 'method',
                        builder: (context, state) =>
                            const SettingsMethodScreen(),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'price-alerts',
                    builder: (context, state) =>
                        const SettingsPriceAlertsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.scan,
        builder: (context, state) => const ScanScreen(),
      ),
      GoRoute(
        path: '${AppRoutes.detail}/:id',
        builder: (context, state) => const DetailScreen(),
      ),
      GoRoute(
        path: AppRoutes.addToken,
        builder: (context, state) => const AddTokenScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'search',
            builder: (context, state) => const AddTokenSearchScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.customToken,
        builder: (context, state) => const CustomTokenScreen(),
      ),
      GoRoute(
        path: AppRoutes.buy,
        builder: (context, state) => const BuyScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'detail',
            builder: (context, state) => const BuyDetailScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.send,
        builder: (context, state) => const SendScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'detail',
            builder: (context, state) => const SendDetailScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.receive,
        builder: (context, state) => const ReceiveScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'detail',
            builder: (context, state) => const ReceiveDetailScreen(),
          ),
        ],
      ),
    ],
  );
}
