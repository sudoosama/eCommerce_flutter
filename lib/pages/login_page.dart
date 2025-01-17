import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey=GlobalKey<FormState>();
  String _email,_password;
  bool _obscureText = true;
   Widget _showTitle(){
      return Text('Login', style: Theme.of(context).textTheme.headline1);
   }
   Widget _showEmailInput(){
     return Padding(
                    
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      onSaved: (val)=> _email=val,
                      validator: (val)=>!val.contains('@')? 'Invalid Email': null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter a valid email',
                        icon: Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
   }
   Widget _showPasswordInput(){
     return Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      onSaved: (val)=> _password=val,
                      validator: (val)=>val.length<6?'Username too short': null,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _obscureText=!_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText?Icons.visibility:Icons.visibility_off
                          ),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password, min length 6',
                        icon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
   }

   Widget _showFormAction(){
     return Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        RaisedButton(
                          onPressed:_submit,
                          child: Text(
                            'Submit',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.black),
                          ),
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          color: Theme.of(context).accentColor,
                        ),
                        FlatButton(
                          onPressed: () => Navigator.pushReplacementNamed(context, '/register'),
                          child: Text("New User? Register"),
                        ),
                      ],
                    ),
                  );
   }
   void _submit(){
     final form=_formKey.currentState;
     if(form.validate()){
       form.save();
       print('Email: $_email, Password: $_password');
     }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _showTitle(),
                  _showEmailInput(),
                  _showPasswordInput(),
                  _showFormAction(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
