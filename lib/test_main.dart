const myConst = null;

void main(){

  print('Hello world');

  int myInt = 15;
  double myDouble = 4.5;

  var myVar = 10;
  //myVar = "love"; error

  dynamic myDynamic = 10;
  myDynamic = "love";

  final myFinal;
  myFinal = 10;
  //myFinal = 12; error

  //myConst = 10; error

  String val = getName(true, 25, name : "Pierre");

}

String getName(bool love, int age, {String? name}){
  if (love){
    if (age > 15){
      if (name != null){
        return name;
      }

    }
  }
  return "name not found";

}