part of 'l10n_bloc.dart';


sealed class L10nEvent {}

final class L10nEventLocaleChangeRequested extends L10nEvent {
  final String countryCode;

  L10nEventLocaleChangeRequested(this.countryCode);
}
