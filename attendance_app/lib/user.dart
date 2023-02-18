class Users{
  
  final int? uSeq;
  final String email;
  final String password;
  final String tel;
  final String joinDate;
  

  Users({this.uSeq, required this.email, required this.password, required this.tel, required this.joinDate});

  Users.fromMap(Map <String, dynamic> use)

    :uSeq = use['uSeq'],
    email = use['email'],
    password = use['password'],
    tel = use['tel'],
    joinDate = use['joinDate']

    Map<String, Object?> toMap(){
      
      return{'uSeq' : uSeq, 'email' : email, 'password' : password, 'tel' : tel, 'joinDate' : joinDate};

    }

}

