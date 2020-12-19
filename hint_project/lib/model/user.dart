class users{


  final String email;
  final String location;
  final String phoneNumber;
  final String name;
  final String uid;


  users( {this.uid,this.name,this.phoneNumber, this.email,this.location});



  factory users.fromMap( Map data){
    data = data ?? { };
    return users(
        uid: data['uid']??'',
        email: data['email'] ?? '',
        location: data['location']??'',
        phoneNumber: data['phoneNumber']??'',
        name: data['name']??''

    );
  }
}




