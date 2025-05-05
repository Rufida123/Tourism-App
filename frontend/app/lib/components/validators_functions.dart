String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a name';
  }
  return null; // Indicates that the input is valid
}

String? validateLastName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a Last Name';
  }
  return null;
}
