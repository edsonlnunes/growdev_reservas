import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gd_reservas/layouts/pages/aulas_agendadas.page.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'layouts/widgets/fade_animation.dart';
import 'utils/lang/determinar_localizacao.dart';

bool ativo = false;

// comentario alterado

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      title: 'Growdev Reservas',
      theme: growDevTheme(),
      home: AulasAgendadas(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Splash(
        //   seconds: 6,
        //   navigateAfterSeconds: LoginPage(title: 'Reservas GrowDev'),
        //   loaderColor: Colors.transparent,
        // ),
        Center(
          child: FadeAnimation(
            2.0,
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/img/png/logo_transparente_laranja.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
