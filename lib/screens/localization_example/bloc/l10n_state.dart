part of 'l10n_bloc.dart';

sealed class L10nState {}

final class L10nInitial extends L10nState {}

final class L10nLocalChanged extends L10nState {
  final String countryCode;

  L10nLocalChanged({required this.countryCode});
}
