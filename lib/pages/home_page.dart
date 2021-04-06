import 'package:api_nasa_prueba/models/Astronomy.dart';
import 'package:api_nasa_prueba/servicio/servicio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServicioApiNasa servicioApiNasa = new ServicioApiNasa();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff114591),
        title: Text("prueba-APi-Nasa"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: servicioApiNasa.getDatosApi(),
        builder: (context, AsyncSnapshot<List<Astronomy>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _crearTarjetaPersonalisable(context, index, snapshot);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _crearTarjetaPersonalisable(BuildContext context, int index,
      AsyncSnapshot<List<Astronomy>> snapshot) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 300,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
              BorderSide(color: Colors.yellow[300], width: 2)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: snapshot.data[index].mediaType == "image"
                  ? NetworkImage(snapshot.data[index].url)
                  : NetworkImage("https://i.stack.imgur.com/y9DpT.jpg"))),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff477dfa).withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                snapshot.data[index].date,
                style: TextStyle(fontSize: 15, color: Colors.blue[600]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "${snapshot.data[index].title}",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearTarjetas(BuildContext context, int index,
      AsyncSnapshot<List<Astronomy>> snapshot) {
    return Card(
      elevation: 2.8,
      shadowColor: Colors.blue[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image(
                  image: snapshot.data[index].mediaType == "image"
                      ? NetworkImage(snapshot.data[index].url)
                      : NetworkImage("https://i.stack.imgur.com/y9DpT.jpg")),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snapshot.data[index].title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  snapshot.data[index].date,
                  style: TextStyle(color: Color(0xff72767e)),
                )
              ],
            ),
          ),
          TextButton(onPressed: () {}, child: Text("View more"))
        ],
      ),
    );
  }
}
