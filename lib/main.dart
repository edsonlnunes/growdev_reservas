import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gd_reservas/controllers/menu.controller.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';
import 'package:provider/provider.dart';
import 'layouts/pages/acesso.page.dart';
import 'themes/theme.dart';
import 'utils/lang/determinar_localizacao.dart';
import 'utils/lang/localizacoes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => MenuController(),
        builder: (context, snapshot) {
          return MaterialApp(
            supportedLocales: [
              const Locale('pt', 'BR'),
              const Locale('en', 'US'),
            ],
            localizationsDelegates: [
              const DeterminarLocalizacao(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            localeResolutionCallback:
                (Locale locale, Iterable<Locale> supportedLocales) {
              for (Locale supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode ||
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }

              return supportedLocales.first;
            },
            onGenerateTitle: (ctx) =>
                Localizacoes.of(ctx).traduzir('TITULO_APP'),
            theme: growDevTheme(),
            home: AcessoPage(),
          );
        });
  }
}
