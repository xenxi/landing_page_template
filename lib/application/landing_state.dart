part of 'landing_bloc.dart';

@immutable
class LandingState {
  final int viewIndex;

  const LandingState._({required this.viewIndex});
  factory LandingState.initial() => const LandingState._(viewIndex: 0);

  LandingState copyWith({
    int? viewIndex,
  }) {
    return LandingState._(
      viewIndex: viewIndex ?? this.viewIndex,
    );
  }
}
