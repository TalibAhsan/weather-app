import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController cityNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
         width:width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/screen2.jpeg'),fit:BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
                IconButton(
                    onPressed: () {
                      print("pressed");
                      Navigator.pop(context);
                      
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: cityNameController,
                    decoration: InputDecoration(
                      hintText:'Enter Your City Name',
                      hintStyle: TextStyle(fontSize: 25),
                      fillColor: Colors.white,
                      labelText: 'City Name ',
                      filled: true,
                    
                    ),
                    ),
                  ),
                  GestureDetector(
                    child: Center(
                      child: Text(
                        "Get Weather",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.pop(context,cityNameController.text);
                    },
                  ),
            ],
          ),
      ),
    );
      
  }
}