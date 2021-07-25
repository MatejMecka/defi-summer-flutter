bool validateKey (value, isPublicKey) {
  String reg = "S[A-Z0-9]{55}";
  if(isPublicKey) {
    reg = "G[A-Z0-9]{55}";
  }
 
  RegExp regExp = new RegExp(
    reg,
    caseSensitive: false,
    multiLine: false,
  );

  return regExp.hasMatch(value);
}