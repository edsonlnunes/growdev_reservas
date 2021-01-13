import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gd_reservas/layouts/widgets/modal_cancelar.widget.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:splashscreen/splashscreen.dart';
import 'layouts/pages/login.page.dart';
import 'layouts/widgets/fade_animation.dart';
import 'package:gd_reservas/layouts/pages/aulas_disponiveis.page.dart';
import 'layouts/widgets/modal_cancelar.widget.dart';
import 'layouts/widgets/modal_form.dart';
import 'utils/lang/localizacoes.dart';
import 'utils/lang/determinar_localizacao.dart';

bool ativo = false;

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
      title: 'Flutter Demo',
      theme: growDevTheme(),
      home: MyHomePage(),
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
        SplashScreen(
          seconds: 6,
          navigateAfterSeconds: LoginPage(title: 'Reservas GrowDev'),
          loaderColor: Colors.transparent,
        ),
        Center(
          child: FadeAnimation(
            2.0,
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/img/Png/logo_transparente_laranja.png"),
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
