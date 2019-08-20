import 'package:flutter/material.dart';
import 'package:todo_list/i10n/localization_intl.dart';
import 'package:todo_list/model/login_page_model.dart';
import 'package:todo_list/utils/theme_util.dart';

import 'bottom_to_top_widget.dart';

class LoginWidget extends StatelessWidget {
  final LoginPageModel loginPageModel;

  const LoginWidget({Key key, @required this.loginPageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final primaryColorLight = Theme.of(context).primaryColorLight;
    final primaryColorDark = Theme.of(context).primaryColorDark;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: Form(
        autovalidate: true,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BottomToTopWidget(
                  child: Theme(
                    data: ThemeData(
                        platform: TargetPlatform.android,
                        primaryColor: primaryColor),
                    child: TextFormField(
                      validator: (email) =>
                          loginPageModel.logic.validatorEmail(email),
                      keyboardType: TextInputType.text,
                      controller: loginPageModel.emailController,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                          hintText: DemoLocalizations.of(context).inputEmail,
                          labelText: DemoLocalizations.of(context).email,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () => Future.delayed(
                              Duration(milliseconds: 100),
                              () => loginPageModel.emailController?.clear(),
                            ),
                          )),
                    ),
                  ),
                  index: 0,
                ),
                BottomToTopWidget(
                  child: Theme(
                    data: ThemeData(
                        platform: TargetPlatform.android,
                        primaryColor: primaryColor),
                    child: TextFormField(
                      validator: (password) =>
                          loginPageModel.logic.validatePassword(password),
                      controller: loginPageModel.passwordController,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                          hintText: DemoLocalizations.of(context).inputPassword,
                          labelText: DemoLocalizations.of(context).password,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: FlatButton(
                            onPressed: loginPageModel.logic.onForget,
                            child: Text(DemoLocalizations.of(context).forget),
                          )),
                        obscureText: true,
                    ),
                  ),
                  index: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                BottomToTopWidget(
                  index: 2,
                  child: Container(
                    height: 60,
                    width: size.width - 80,
                    child: FlatButton(
                      color: primaryColor,
                      highlightColor: primaryColorLight,
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Text(
                        DemoLocalizations.of(context).logIn,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: loginPageModel.logic.onLogin,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BottomToTopWidget(
                  index: 2,
                  child: Container(
                    height: 60,
                    width: size.width - 80,
                    child: FlatButton(
                      color: primaryColor.withOpacity(0.3),
                      highlightColor: primaryColorLight,
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Text(
                        DemoLocalizations.of(context).haveNoAccount,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(color: primaryColorDark)),
                      onPressed: loginPageModel.logic.onRegister,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
