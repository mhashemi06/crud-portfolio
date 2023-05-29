class Customer{
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? phoneNumber;
  String? email;
  String? bankAccountNumber;

  Customer(
      {
        required this.firstName,
        required this.lastName,
        required this.dateOfBirth,
        required this.phoneNumber,
        required this.email,
        required this.bankAccountNumber
      }
      );

  Customer.fromJson(Map<String ,dynamic> json):
        firstName=json["firstName"],
        lastName=json["lastName"],
        dateOfBirth=json["dateOfBirth"],
        phoneNumber=json["phoneNumber"],
        email=json["email"],
        bankAccountNumber=json["bankAccountNumber"];


  Map<String,dynamic> toJson(){
    return{
    "firstName":firstName,
    "lastName":lastName,
    "dateOfBirth":dateOfBirth,
    "phoneNumber":phoneNumber,
    "email":email,
    "bankAccountNumber":bankAccountNumber
  };
  }

}