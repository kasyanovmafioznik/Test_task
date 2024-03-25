import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final TextEditingController _textController = TextEditingController();
  String _displayText = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Input Test'),
        backgroundColor: Colors.indigo,
        
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Введите текст', 
                 ),
                 validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите текст';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _displayText = _textController.text;
                        });
                      }
                    },
                    child: const Text('Показать текст'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _textController.clear();
                      });
                    },
                    child: const  Text('Очистить'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                _displayText,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
  
