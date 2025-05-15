import 'package:cook_book/models/receitas_model.dart';
import 'package:flutter/material.dart';

class DetalhesReceitas extends StatefulWidget {
  const DetalhesReceitas({super.key});

  @override
  State<DetalhesReceitas> createState() => _DetalhesReceitasState();
}

class _DetalhesReceitasState extends State<DetalhesReceitas> {
  List<bool> checkboxList = List.generate(50, (index) => false);
  @override
  Widget build(BuildContext context) {
    ReceitasModel argsFromListaReceitas =
        ModalRoute.of(context)!.settings.arguments as ReceitasModel;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String ingredients = argsFromListaReceitas.ingredientes;
    List<String> list = ingredients.split(',');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            border: Border.all(
              color: const Color(0xFF9687AD),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: height * 0.043,
          width: width * 0.755,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              argsFromListaReceitas.nomeReceita,
              style: const TextStyle(color: Color(0xFF000000)),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 25),
          const Text(
            'Ingredientes',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 7),
          Expanded(
            flex: 1,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      checkboxList[index] = !checkboxList[index];
                      setState(() {});
                    },
                    leading: Checkbox(
                      value: checkboxList[index],
                      onChanged: (value) {
                        checkboxList[index] = !checkboxList[index];
                        setState(() {});
                      },
                    ),
                    title: Text(list[index]),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Modo de Preparo',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    const SizedBox(height: 9),
                    Text(
                      argsFromListaReceitas.modoPreparo,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
