import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum ValidationState { initial, valid, invalid }

@immutable
class ChangePinState with EquatableMixin {
  final String newPin;

  final int retry;

  // This value is null initially.
  // When the old pin is entered correctly this value will be true
  // When the old pin is entered incorrectly this value will be false
  final ValidationState oldPinVerified;

  // This value is null initially.
  // When the new pin is confirmed this value will be true
  // When the confirm pin did not match this value will be false
  final ValidationState newPinConfirmed;

  ChangePinState({
    this.newPin,
    this.oldPinVerified = ValidationState.initial,
    this.newPinConfirmed = ValidationState.initial,
    this.retry = 0,
  });

  ChangePinState copyWith({
    String newPin,
    ValidationState oldPinVerified,
    ValidationState newPinConfirmed,
    int retry,
  }) {
    return new ChangePinState(
      newPin: newPin ?? this.newPin,
      oldPinVerified: oldPinVerified ?? this.oldPinVerified,
      newPinConfirmed: newPinConfirmed ?? this.newPinConfirmed,
      retry: retry ?? this.retry,
    );
  }

  @override
  String toString() {
    return 'ChangePinState {new pin: $newPin, old verified: $oldPinVerified, new confirmed: $newPinConfirmed, retry: $retry}';
  }

  @override
  List<Object> get props {
    return [newPin, oldPinVerified, newPinConfirmed, retry];
  }
}
