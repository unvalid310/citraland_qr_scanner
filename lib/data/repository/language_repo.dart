import 'package:flutter/material.dart';
import 'package:citraland/data/model/response/language_model.dart';
import 'package:citraland/utill/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext context}) {
    return AppConstants.languages;
  }
}
