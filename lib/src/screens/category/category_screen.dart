// ignore_for_file: prefer_const_constructors, sort_child_properties_last, file_names, library_prefixes, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, unused_local_variable
import 'package:flutter/material.dart';
import '../../constants/custom_colors.dart';

// ignore: camel_case_types
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

// ignore: camel_case_types
class _CategoryScreenState extends State<CategoryScreen> {
  var controllerName = TextEditingController();
  var controllerDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Cadastro Categoria",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 145, 0, 0),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      controller: controllerName,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 145, 0, 0)),
                        prefixIcon: Icon(
                          Icons.fastfood,
                          color: const Color.fromARGB(255, 145, 0, 0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: const Color.fromARGB(255, 145, 0, 0)))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: const Color.fromARGB(255, 145, 0, 0)))),
                      ),
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: controllerDesc,
                      decoration: InputDecoration(
                        labelText: "Descrição",
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 145, 0, 0)),
                        prefixIcon: Icon(
                          Icons.insert_comment,
                          color: const Color.fromARGB(255, 145, 0, 0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: const Color.fromARGB(255, 145, 0, 0)))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: (BorderSide(
                                color: const Color.fromARGB(255, 145, 0, 0)))),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColors().getActivePrimaryButton()),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
