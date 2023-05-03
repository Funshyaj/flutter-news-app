abstract class AuthenticationService {
  bool userLoggedIn();
}


class AuthenticationServiceImpl extends AuthenticationService {
  @override
  bool userLoggedIn() {
    return true;
  }
}

