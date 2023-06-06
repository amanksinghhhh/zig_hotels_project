class Validation {
  String? validateEmptyFields(String? value, String validationText) {
    if (value!.isEmpty) {
      return validationText;
    }
    return null;
  }
}
