part of app.auth;

class ForgotPasswordView extends StatefulWidget {
  static String route = '${AuthView.route}/forgot_password';

  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final NavigatorService navigator = locator<NavigatorService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthRepository? repository;

  String? emailError;

  @override
  initState() {
    repository = AuthRepository();
    super.initState();
  }

  bool get disableButton =>
      emailController.text.isEmpty ;

  Future<void> forgotPassword() async {
     await repository?.restorePassword(
        email: emailController.text);    
  }

  

  void onValidateEmail(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    bool isValid = regex.hasMatch(email.trim());
    setState(() {
      isValid ? emailError = null : emailError = 'invalid email';
    });
  }

  void navigateToSignUp() {
    navigator.push(route: SignUpView.route, key: navigator.authNavigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Center (
          child:Text(
          'Forgot Password',
          style: TextStyle(            
              fontSize: getProportionsScreenHeigth(18), color: secondaryColor),
        ),)
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        // Bloquear el scroll superior
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
               SizedBox(
                height: getProportionsScreenHeigth(48),
              ),                
              Text(
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionsScreenHeigth(28),
                ),
              ),
              Text(
                'Please enter your email and we will send \nyou link to return to your account',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
               SizedBox(
                height: getProportionsScreenHeigth(24),
              ), 
              Input(
                label: 'email',
                icon: Icons.email_outlined,
                controller: emailController,
                placeholder: 'Enter your email',
                onChange: onValidateEmail,
                error: emailError,
              ),                                                      
               SizedBox(
                height: getProportionsScreenHeigth(144),
              ),                 
              Button(
                label: 'Send',
                onPress: forgotPassword,
                disable: disableButton,
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),             
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                  ),
                  InkWell(
                    onTap: navigateToSignUp,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: primaryColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
