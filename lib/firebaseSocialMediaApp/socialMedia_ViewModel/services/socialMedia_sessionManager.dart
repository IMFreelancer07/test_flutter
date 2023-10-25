
class socialMedia_sessionManager{

  static final socialMedia_sessionManager _session = socialMedia_sessionManager._internal();

  String? userId;

  factory socialMedia_sessionManager(){
    return _session;
  }

  socialMedia_sessionManager._internal(){

  }
}