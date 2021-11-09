part of app.core;



class ValidateOtpView extends StatefulWidget {

static String route =  '${CoreView.route}/validate';


  _ValidateOTPViewState createState() => _ValidateOTPViewState();

}

class _ValidateOTPViewState  extends State<ValidateOtpView> {

 @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login6',
          style: TextStyle(
              fontSize: getProportionsScreenHeigth(14), color: secondaryColor),
        ),
      ),
     
    );
  }



}