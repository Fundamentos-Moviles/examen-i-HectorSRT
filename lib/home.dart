import 'package:examen1_cahs/more_info.dart';
import 'package:flutter/material.dart';
import 'package:examen1_cahs/utils/constants.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  @override
  void initState() {
    lista = List.from(con.listaExamen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: const Color(0xff014b52),
          ),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Container(
                      width: size.width * .95,
                      height: size.height * .08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Notificaciones de actividades',
                          style: TextStyle(
                            color: Color(0xFF908600),
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (BuildContext context, int index) {
                        var datos = lista[index].toString().split('#');
                        int estrellas = int.parse(datos[4].trim());

                        return Row(
                          children: [
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.white,
                                margin: const EdgeInsets.only(bottom: 20.0),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            datos[1],
                                            style: const TextStyle(
                                              fontSize: 45,
                                              color: Color(0xff014b52),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            datos[2], // Título
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            datos[3], // Descripción
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Spacer(),
                                              ...List.generate(
                                                estrellas,
                                                    (index) => Icon(
                                                  Icons.star,
                                                  color: Colors.yellowAccent[700],
                                                ),
                                              ),
                                              ...List.generate(
                                                5 - estrellas,
                                                    (index) => Icon(
                                                  Icons.star,
                                                  color: Colors.grey[700],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Icon(
                                        Icons.energy_savings_leaf_outlined,
                                        color: Colors.green[700],
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (index % 2 != 0)
                              Container(
                                width: 180,
                                height: 215,
                                margin: const EdgeInsets.only(left: 30, bottom: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MoreInfo(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF52A486),
                                        minimumSize: const Size(180, 50),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.edit, color: Colors.white),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Ver más',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        showSnackBar('Se ellimino el elemento con el id: ${datos[0]}', 15);
                                        int borrado = index;
                                        int valor = int.parse(datos[1]);
                                        if(valor != 10 && valor != 15 && valor != 20 && valor != 23){
                                          setState(() {
                                            lista.removeAt(borrado);
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF52A486),
                                        minimumSize: const Size(180, 50),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.restore_from_trash_outlined, color: Colors.white),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Borrar',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      width: size.width,
                      height: size.height * .03,
                      padding: EdgeInsets.all(0.2),
                      decoration: BoxDecoration(
                        color: Color(0xff014b52),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'SEGUNDA VISTA: Hector Salvador Contreras Alvarez',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF908600),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String texto, int duracion) {
    final  snackBar = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {

        },
        label: 'Cerrar',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
