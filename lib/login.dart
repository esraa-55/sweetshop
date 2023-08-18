// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icecream.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 340), // Add space at the top
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(13.0),
                          child: TextFormField(
                            
                            controller: emailcontroller,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Email",
                              fillColor: Color(0xFFF9FFFF),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(37)
                              ),
                              
                              prefixIcon: Icon(Icons.email),
                            ),
                            style: const TextStyle(color: Color.fromARGB(255, 236, 101, 169)),
                            validator: (value) {
                              if (value == null || !value.contains("@")) {
                                return "Enter Valid Email";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: TextFormField(
                           
                            controller: passwordcontroller,
                            decoration:  InputDecoration(
                               filled: true,
                               hintText: "Password",
                              fillColor: Color(0xFFF9FFFF),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(37)
                              ),
                              
                              
                              prefixIcon: Icon(Icons.lock,),
                            ),
                            style: const TextStyle(color:Color.fromARGB(255, 236, 101, 169)),
                            obscureText: true,
                            obscuringCharacter: "*",
                            validator: (value) {
                              if (value == null || value.length <= 6) {
                                return "Enter the password";
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool result = await FirebaseLogin(
                                emailcontroller.text,
                                passwordcontroller.text,
                              );
                              if (result == true) {
                                
                               
                             Navigator.push(context,MaterialPageRoute(builder: (context){
                                    return SignUp();
                              
                                    }));}
                                    else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Error, please enter valid email & password"),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 236, 101, 169)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 79, vertical: 18)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27))),
                          ),
                        ),
                        SizedBox(height: 22),
                        // Padding(
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Text("Forget Password? No Yawa, Tap me",
                        //   style: TextStyle(color:Colors.white),
                          
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return SignUp();
                              }));
                            },
                            child: Text(
                              'No Account? Sign Up',
                              style: TextStyle(color:Color.fromARGB(255, 236, 101, 169)),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey[50]),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(horizontal: 79, vertical: 13)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> FirebaseLogin(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}




// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'signup.dart';






// class Login extends StatefulWidget {
//   const Login ({super.key});

//   @override
//   State <Login> createState() =>  _LoginState();
// }

// class  _LoginState extends State <Login > {

// final _formKey = GlobalKey<FormState>();
// TextEditingController emailcontroller = TextEditingController();
// TextEditingController passwordcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
   

//     return SafeArea(
//       child: Scaffold(
//           body: Container(
//         width: double.infinity,
//         height: double.infinity,
//        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/ice.jpg"),
//        fit: BoxFit.fill
       
       
       
//        )),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Center(
//               child: Stack(
                    
               
//                   children: [
//                     Column(
//                       children: [
//                       // Container(
//                       //   width: 1000 ,
//                       //   height: 400,
//                       //  decoration: BoxDecoration(
//                       //   image: DecorationImage(
//                       //     image: AssetImage("assets/first.jpg"),
//                       //     fit:BoxFit.fill
//                       //   ),
//                       //  )
//                       // ),
//                         // Image.asset(
//                         //   "assets/first.jpg",
//                         //   height:350,
//                         //   width: 5000,
//                         // ),
//                         Column(
//                           children: [
//                             Padding(
//                               padding:  EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 controller: emailcontroller,
//                               decoration:  InputDecoration(labelText: "Email", 
//                               prefixIcon: Icon(Icons.email)),
//                               style: const TextStyle(color: Colors.purple),
//                               validator: (value) {
//                                 if(value==null|| value.contains("@")== false)
//                                 {
//                                   return "Enter Valid Email";
//                                 }
//                               },
//                               )
//                             ),
                         
//                          Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 controller: passwordcontroller,
//                               decoration: const InputDecoration(labelText: "Password",
//                               prefixIcon: Icon(Icons.lock)),
//                               style: const TextStyle(color: Colors.purple),
//                               obscureText: true,
//                               obscuringCharacter: "*",
//                               validator: (value) {
//                                 if(value==null || value.length <=6){
//                                   return "Enter the password";
//                                 }
//                               },
//                               )
//                          ),
                    
//                           ElevatedButton(
//                             onPressed: () async {
//                               if(_formKey.currentState!.validate()){
//                               bool result =  await FirebaseLogin(emailcontroller.text,passwordcontroller.text);
//                                 if(result==true){
                                
//                                 Navigator.push(context,MaterialPageRoute(builder: (context){
//                                       return SignUp();
                                
//                                       }));
            
//                                 }
//                                    else{
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text("Error, please Enter the valid email& password"))
//                                   );
//                                    }
                          
                               
            
            
//                                 // final SharedPreferences prefs = await SharedPreferences.getInstance();
//                                 // await prefs.setString('email', emailcontroller.text);
//                                 // Navigator.push(context,MaterialPageRoute(builder: (context){
//                                 //   return Mainscreen(email:emailcontroller.text,);
                                
//                                 //       }));
            
//                               }
                               
                                
                              
//                             },
                            
//                             child:  Text(
//                               'Login',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all(Colors.purple),
//                               padding: MaterialStateProperty.all(
//                                    EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
//                               shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(27))),
                              
//                             )),
//                         // SizedBox(
//                         //   height: 22,),
//                           Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text("forget Password? No Yawa, Tap me"),
//                           ),
                    
                    
                    
//                           Padding(
//                             padding:  EdgeInsets.all(30.0),
//                             child: ElevatedButton(
//                               onPressed: () {
//                                Navigator.push(context, MaterialPageRoute(builder: (context){
//                                 return SignUp();
//                                }));
//                               },
                              
//                               child: Text(
//                                 'No Account? Sign Up',
//                                 style: TextStyle(color: Colors.purple),
//                               ),
//                               style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all(Colors.grey[50]),
//                                 padding: MaterialStateProperty.all(
//                                     EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
//                                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(27))),
//                               )
//                             ),
//                           )
                              
                              
//                                ]
//                         )
                  
                    
//                       ],
//                     ),
//                     // Positioned(
//                     //     left: 0,
//                     //     child: Image.asset(
//                     //       "assets/images/main_top.png",
//                     //       width: 100,
//                     //     )),
//                     // Positioned(
//                     //     bottom: 0,
//                     //     child: Image.asset(
//                     //       "assets/images/main_bottom.png",
//                     //       width: 100,
//                     //     )),
//                   ]),
//             ),
//           ),
//         ),
//       )),
//     );
//   }
//   Future<bool>FirebaseLogin(String email, String password)async{
//     try  {
//   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: email,
//     password: password,
//   );
//   if(userCredential.user !=null){
//     return true;
//   }
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }
// return false;
//   }
  
// }
