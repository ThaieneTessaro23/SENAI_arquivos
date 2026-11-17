import 'package:flutter/material.dart';
import 'package:industria_automobilistica/home.dart';
import 'package:http/http.dart' as http; //biblioteca http
import 'dart:convert'; //pacote para gerar JSON

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Chave global para validar o formulário
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePassword = true;

  //Variável para indicar que o login está sendo processado
  bool entrando = false;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }

    //montar o json com os dados do formulario
    final dadosLogin = {
      "EMAIL": emailController.text.trim(),
      "SENHA": passwordController.text,
    };

    //indicar que os dados estao sendo salvos
    setState(() {
      entrando = true;
    });

    //tentar enviar os dados para a API
    try{
      //faz uma requisição post na API
      final response = await http.post(
        Uri.parse(
          'http://desktop-cb35gig/industria_automotiva_api/public/api/login'
        ),
        //informaq para a API que os dados são em JSON
      headers: {
        'Accept': 'application/json',
        },
        body: jsonEncode(dadosLogin)
      );

        //verificar se o resultado foi sucesso 
      if(response.statusCode == 200){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage()
          ),
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('E-mail ou senha incorretos!')),
        );
      }
    }
    catch (e){
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao acessar a API: $e')),
      );
    }
    finally{
      //atualiza a tela para indicar que o envio terminou
      setState(() {
        entrando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x22000000),
                    blurRadius: 25,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.car_repair,
                    size: 60,
                    color: Color(0xFF1F4E5F),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'AUTOMOTIVE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF263238),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sistema de gestão industrial automobilística',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF78909C)),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Esqueci minha senha'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 52,
                    child: FilledButton(
                      onPressed: login,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF1F4E5F),
                      ),
                      child: const Text(
                        'ENTRAR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}