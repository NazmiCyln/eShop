import 'package:fake_store_api/bottom_navigation_bar/navigation_bar.dart';
import 'package:fake_store_api/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

bool kayitDurumu = false;

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          if (kayitDurumu)
            textFormField(
              _nameController,
              Icons.person,
              "İsminizi giriniz",
              TextInputType.name,
              false,
            ),
          textFormField(
            _emailController,
            Icons.email,
            "E-mail adresinizi giriniz",
            TextInputType.emailAddress,
            false,
          ),
          textFormField(
            _passwordController,
            Icons.password,
            "Şifrenizi giriniz",
            TextInputType.number,
            true,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                kayitEkle();
              });
            },
            child: Text(
              kayitDurumu ? "Kayıta Ol" : "Giriş Yap",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    kayitDurumu = !kayitDurumu;
                  });
                },
                child: Text(
                  kayitDurumu ? "Hesabım Var" : "Kayıt Ol",
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  //TextFormField tasarımları
  Container textFormField(TextEditingController controller, IconData icons,
      String hintText, TextInputType inputType, bool obscureText) {
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icons,
            color: Colors.blueGrey,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
              width: 1,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  //Kayıt oluştur, kayıt varsa giriş yap
  void kayitEkle() async {
    if (!kayitDurumu) {
      _authService.signIn(_emailController.text, _passwordController.text).then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationBar(),
              ),
            ),
          );
    } else {
      _authService.createPerson(_nameController.text, _emailController.text,
          _passwordController.text);
    }
  }
}
