void main() {
  int number = 30;
  int base = 2;
  print("O número decimal $number na base $base é igual a ${decToOtherBase(number, base)}");
}

String decToOtherBase(int decimalNumber, int base) {
  String convertedNumber = "";
  int resto;
  do {
    resto = decimalNumber % base;
    decimalNumber = decimalNumber ~/ base;
    if(resto > 9) {
      convertedNumber = "${swapNumberToHexCharacter(resto)}$convertedNumber";
    } else {
      convertedNumber = "${resto.toString()}$convertedNumber";
    }
  } while (decimalNumber != 0);
  
  return convertedNumber;
}

String swapNumberToHexCharacter(int number) {
  switch (number) {
    case 10: return "A";
    case 11: return "B";
    case 12: return "C";
    case 13: return "D";
    case 14: return "E";
    case 15: return "F";
    default: return "";
  }
}