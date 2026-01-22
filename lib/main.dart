import 'package:flutter/material.dart'; // Librería base de diseño de Flutter
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Librería de Mapas

// Función principal: Aquí arranca la app
void main() => runApp(MiAplicacionMapa());

class MiAplicacionMapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta "Debug" de la esquina
      title: 'Localizador Familiar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaMapa(), // Cargamos nuestra pantalla del mapa
    );
  }
}

// Creamos una pantalla con "Estado" (Stateful) porque el mapa se mueve y cambia
class PantallaMapa extends StatefulWidget {
  @override
  _PantallaMapaState createState() => _PantallaMapaState();
}

class _PantallaMapaState extends State<PantallaMapa> {
  // Controlador: Es como el mando a distancia para mover el mapa por código
  late GoogleMapController mapController;

  // COORDENADAS: Punto inicial del mapa he puesto la plaza de detras de la lonja.
  final LatLng _centroInicial = const LatLng(39.474336, -0.377804);

  // MARCADORES: Aquí guardamos los "pines" que se verán en el mapa
  final Set<Marker> _marcadores = {};

  // Esta función se ejecuta sola cuando el mapa termina de cargarse
  void _cuandoSeCreeElMapa(GoogleMapController controller) {
    mapController = controller;

    // Una vez cargado, añadimos el marcador de la persona
    setState(() {
      _marcadores.add(
        Marker(
          markerId: MarkerId('id_abuelo'), // Identificador único interno
          position: _centroInicial, // Dónde lo pintamos
          infoWindow: InfoWindow(
            title: 'Persona Dependiente', // Lo que sale al tocar el pin
            snippet: 'Ubicación actualizada hace 1 min',
          ),
          icon: BitmapDescriptor.defaultMarker, // Pin rojo estándar
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior verde
      appBar: AppBar(
        title: Text('Monitorización GPS'),
        backgroundColor: Colors.green[700],
      ),
      // EL MAPA
      body: GoogleMap(
        onMapCreated: _cuandoSeCreeElMapa, // Vinculamos el controlador
        initialCameraPosition: CameraPosition(
          target: _centroInicial, // Dónde empieza mirando la cámara
          zoom: 15.0, // Nivel de zoom (15 es nivel calle)
        ),
        markers: _marcadores, // Le pasamos la lista de pines a pintar
      ),

      // Botón flotante para recentrar
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Al pulsar, movemos la cámara suavemente al centro
          mapController.animateCamera(
            CameraUpdate.newLatLng(_centroInicial),
          );
        },
        label: Text('Centrar'),
        icon: Icon(Icons.gps_fixed),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}