# 📍 App de Localización y Monitorización (Flutter)

Este proyecto consiste en un prototipo funcional de una aplicación móvil desarrollada en **Flutter** para la localización de personas dependientes. Integra los servicios de **Google Maps** para visualizar ubicaciones en tiempo real, marcadores personalizados y control de cámara.

## 📋 Características
* **Visualización de Mapas:** Integración nativa con Google Maps SDK.
* **Marcadores (Markers):** Ubicación visual de la persona dependiente en el mapa.
* **Control de Cámara:** Botón flotante para recentrar la vista automáticamente.
* **Seguridad:** Gestión de credenciales (API Keys) mediante variables de entorno locales para evitar su exposición en repositorios públicos.

## 🛠️ Requisitos Previos
* **Flutter SDK:** Instalado y configurado en el PATH.
* **Android Studio:** Con el emulador configurado.
* **Google Cloud Console:** Una cuenta activa para generar la API Key de Maps SDK for Android.

## 🔐 Configuración de Seguridad (Importante)
Este proyecto utiliza el archivo `local.properties` para inyectar la API Key de forma segura. Este archivo **NO** se sube al repositorio por seguridad. Para ejecutar el proyecto, debes crear tu propia configuración:

### Paso 1: Obtener la API Key
1. Ve a la [Google Cloud Console](https://console.cloud.google.com/).
2. Crea un proyecto y habilita el servicio **"Maps SDK for Android"**.
3. En "Credenciales", genera una nueva **Clave de API**.

### Paso 2: Crear el archivo de secretos
En la carpeta raíz del proyecto de Android (`android/`), crea o edita el archivo `local.properties` y añade tu clave al final:

```properties
sdk.dir=/Ruta/a/tu/SDK (esta línea suele estar ya)
MAPS_API_KEY=PEGAR_AQUI_TU_CLAVE_LARGISIMA_DE_GOOGLE
```
### Paso 3: Verificar la configuración
El proyecto ya está preconfigurado para leer esta clave automáticamente.

* android/app/build.gradle.kts: Se encarga de leer el archivo local.properties.

* AndroidManifest.xml: Utiliza la variable ${mapsApiKey} para autenticarse con Google.

Nota: Nunca subas tu archivo local.properties a GitHub. Asegúrate de que está incluido en tu .gitignore (por defecto Flutter ya lo hace).

## 🚀 Instalación y Ejecución
1. Clonar el repositorio:

```Bash
git clone <URL_DE_TU_REPOSITORIO>
```
2. Instalar dependencias: Desde la terminal, en la carpeta del proyecto:

```Bash
flutter pub get
```
3. Ejecutar en emulador: Abre un emulador en Android Studio y ejecuta:

```Bash
flutter run
```
## 📱 Capturas / Funcionamiento
La aplicación iniciará centrada en las coordenadas predefinidas, mostrando un marcador con la etiqueta "Persona Dependiente". Al pulsar sobre el marcador, se despliega una ventana de información con el estado.
<img width="258" height="550" alt="image" src="https://github.com/user-attachments/assets/752a85e6-5e23-4494-9206-ed2335ed5a22" />


***

### Autor
- Santiago Lafuente Hernández.
