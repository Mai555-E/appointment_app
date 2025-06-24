class Validation {
  static final phoneRegExp = RegExp(r'^\+?[0-9]{13,15}$');
static  final  nameRegExp = RegExp(r"^[a-zA-Z\s'-]{2,50}$");
  static final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{4,20}$');

  static final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  Validation._();
  static String? validate({required String val, required String fieldName}) {
    if (val.isNotEmpty) {
      switch (fieldName.toLowerCase()) {
        case "username":
          return (!usernameRegex.hasMatch(val)) ? 'Enter valid username' : null;
           case "name":
          return (!nameRegExp.hasMatch(val)) ? 'Enter valid name' : null;

        case "password":
          return (!passwordRegex.hasMatch(val.trim())) ? 'Enter valid password' : null;

        case "email":
          return (!emailRegex.hasMatch(val.trim())) ? 'Enter valid email' : null;

        case "phone":
          return (!phoneRegExp.hasMatch(val.trim())) ? 'Enter valid phone number' : null;
        default:
          return null;
      }
    } else {
      return ' Field is required';
    }
  }
}
