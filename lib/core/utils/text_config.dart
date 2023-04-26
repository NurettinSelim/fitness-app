class TextConfig {
  static const appName = "Fitness App";
  static ErrorMessages errorMessages = const ErrorMessages();
  static FormMessages formMessages = const FormMessages();
}

class FormMessages {
  const FormMessages();
  String get emailLabel => "E-Mail";
  String get passwordLabel => "Password";
  String get nameLabel => "Your Name";
  String get forgotPassText => "Forgot password?";
}

class ErrorMessages {
  const ErrorMessages();
  String get incorrectMail => "Lütfen mailinizi kontrol edip tekrar giriniz.";
  String get emptyValue => "Bu alan boş bırakılamaz.";
  String get shortPassword => "Şifreniz 6 karakterden kısa olamaz.";
  String get incorrectPhone => "Hatalı telefon numarası.";
}
