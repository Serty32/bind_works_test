import 'dart:core';

import 'package:flutter/material.dart';

const _shieldCheckmarkOutlineGreenIcon = Icon(
  Icons.shield_outlined,
  color: Colors.green,
  shadows: <Shadow>[
    Shadow(
      color: Colors.greenAccent,
      blurRadius: 14.0,
    )
  ],
  size: 28,
);
const _shieldCheckmarkOutlineShadowIcon = Icon(
  Icons.shield,
  color: Colors.red,
  size: 24,
);

mixin passwordValidationMixin {
  final formKey = GlobalKey<FormState>();
  bool formIsValid = false;
  String password = '';
  String serviceName = '';
  String nickName = '';
  Icon passwordValidationLengthIcon = _shieldCheckmarkOutlineShadowIcon;
  Icon passwordValidationDigitsLowerUperCaseLettersIcon =
      _shieldCheckmarkOutlineShadowIcon;
  Icon passwordValidationSpecialCharachtersIcon =
      _shieldCheckmarkOutlineShadowIcon;
  final RegExp passwordRegexLength = RegExp(r'^\S{5,}');
  final RegExp passwordRegexDigitsLowerCaseUperCaseLetters =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])\S{0,}$');
  final RegExp passwordRegexSpecialCharacters =
      RegExp(r'^(?=.*[±!@#$%^&*()_+{}:"|<>?,.\/;"\\[\]])\S{0,}$');

  bool get isSaveButtonActive {
    if (password.isNotEmpty &&
        serviceName.isNotEmpty &&
        nickName.isNotEmpty &&
        formIsValid) {
      return true;
    }
    return false;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) {
      return null;
    }
    final regexpPattern = RegExp(
        '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#\u0024~&*§~±!%^()_+{}:|<>?,.\u0022])\\S{5,}\u0024');

    if (regexpPattern.hasMatch(password) == false) {
      return 'Password doesn\'t meet criteria :(';
    }
    return null;
  }

  void validateLengthPassword(String value) {
    if (passwordRegexLength.hasMatch(value)) {
      passwordValidationLengthIcon = _shieldCheckmarkOutlineGreenIcon;
    } else {
      passwordValidationLengthIcon = _shieldCheckmarkOutlineShadowIcon;
    }
  }

  void validateDigitsLowerCaseUperCaseLettersPassword(String value) {
    if (passwordRegexDigitsLowerCaseUperCaseLetters.hasMatch(value)) {
      passwordValidationDigitsLowerUperCaseLettersIcon =
          _shieldCheckmarkOutlineGreenIcon;
    } else {
      passwordValidationDigitsLowerUperCaseLettersIcon =
          _shieldCheckmarkOutlineShadowIcon;
    }
  }

  void validateSpecialCharactersPassword(String value) {
    if (passwordRegexSpecialCharacters.hasMatch(value)) {
      passwordValidationSpecialCharachtersIcon =
          _shieldCheckmarkOutlineGreenIcon;
    } else {
      passwordValidationSpecialCharachtersIcon =
          _shieldCheckmarkOutlineShadowIcon;
    }
  }
}
