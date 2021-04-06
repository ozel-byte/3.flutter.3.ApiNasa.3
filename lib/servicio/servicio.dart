import 'dart:convert';

import 'package:api_nasa_prueba/models/Astronomy.dart';
import 'package:http/http.dart' as http;

class ServicioApiNasa {
  Future<List<Astronomy>> getDatosApi() async {
    String _url = "api.nasa.gov";
    String _path = "/planetary/apod";
    final _parametros = {
      "api_key": "OY6GMKJBOMXwZoOiw43KWLUinWVmzjSq5uKcr2Fv",
      "start_date": "2019-07-08",
      "end_date": "2019-07-20"
    };
    final response = await http.get(Uri.https(_url, _path, _parametros));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final astronomy = new Astronomys.fromJsonList(decodedData);
      print(astronomy.listaAstronomy[0].url);
      return astronomy.listaAstronomy;
    } else {
      return [];
    }
  }
}
