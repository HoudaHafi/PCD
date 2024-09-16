import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../login_page.dart';
import '../registration_provider.dart';

class FirstRoute extends StatelessWidget {
  final String iphash;
  final String nomEnt;
  final String email;
  final String numtel;
  final String addEnt;
  final String ethaddress;
  final String category;
  final String password;
  final String code;
  const FirstRoute(this.iphash, this.nomEnt, this.email, this.numtel,
      this.addEnt, this.ethaddress, this.category, this.password, this.code);

  @override
  Widget build(BuildContext context) {
    final RegistrationProvide = Provider.of<RegistrationProvider>(context);
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final id = args['id']!;
    // final name = args['name']!;
    final TextEditingController _codeController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'Email Verification',
                //   style: GoogleFonts.bebasNeue(
                //     fontSize: 60,
                //   ),
                // ),
                Icon(
                  Icons.check_circle, // Icône de vérification
                  size: 100.0, // Taille de l'icône
                  color: Colors.green, // Couleur de l'icône
                ),
                SizedBox(height: 100),
                Text(
                  'Compte YHS créé ! Veuillez regarder dans votre boîte de réception un code est envoyé afin de vérifier votre adresse e-mail:',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Color.fromARGB(255, 1, 1, 9),
                  ),
                ),
                SizedBox(height: 90),
                Text(
                  email,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Color.fromARGB(255, 11, 103, 84),
                  ),
                ),
                SizedBox(height: 50),
                //email

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _codeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter the Verification Code',
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      print("this the code " + code);
                      if (_codeController.text == code) {
                        RegistrationProvide.registringF(
                            iphash,
                            nomEnt,
                            email,
                            BigInt.parse(numtel),
                            addEnt,
                            ethaddress,
                            category,
                            password);
                        print(iphash);
                        print("godd jobbb");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginPage()));
                      } else {
                        print("code invalide");
                      }
                    },
                    child: Text('Verify'),
                  ),
                ),
                SizedBox(height: 10),
                //not a member?
              ],
            ),
          ),
        ),
      ),
    );
  }
}
