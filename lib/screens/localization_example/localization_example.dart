import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tp_instagram_app/screens/localization_example/bloc/l10n_bloc.dart';

class LocalizationExample extends StatelessWidget {
  const LocalizationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localization Example"),
      ),
      body: Column(
        children: [
          const Text("Hello World"),
          Text(AppLocalizations.of(context).helloWorld),
          Text(AppLocalizations.of(context).goodMorning),
          TextButton(
            onPressed: () {
              BlocProvider.of<L10nBloc>(context)
                  .add(L10nEventLocaleChangeRequested("ne"));
            },
            child: const Text("Change to np"),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<L10nBloc>(context)
                  .add(L10nEventLocaleChangeRequested("en"));
            },
            child: const Text("Change to english"),
          ),
        ],
      ),
    );
  }
}
