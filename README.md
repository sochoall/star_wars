# star_wars

Lista de personajes

## Aplicativo de Personajes de Star Wars

Este aplicativo muestra todos los personajes de Star Wars utilizando la API de SWAPI (https://swapi.dev/) con las siguientes características:
Características

    Muestra una lista de personajes de Star Wars con información básica, incluyendo nombre, películas en las que ha aparecido y género.
    Permite al usuario filtrar los personajes por género: masculino, femenino y sin datos.
        El filtro se mantiene durante el desplazamiento (scroll) de la lista, a menos que el usuario decida quitarlo.
        El filtro puede limpiarse para mostrar todos los personajes nuevamente en la pantalla.
    Los usuarios pueden ver más personajes mientras realizan un gesto swipe-up sobre la pantalla.
    Muestra el logo del aplicativo, un cubo, en el centro superior de la pantalla.
        El logo gira reactivamente a los movimientos giratorios del dispositivo, utilizando código nativo (Kotlin) para detectar los movimientos en el sensor de giroscopio.
        La construcción del cubo está hecha matemáticamente, sin paquetes de terceros o plugins.

Implementación

El aplicativo está estructurado utilizando Flutter 3.0.5 y arquitectura en capas y los siguientes componentes:

    main.dart: Punto de entrada de la aplicación.
    data: Capa de acceso a datos.
        dto: Objetos de transferencia de datos (DTO).
        network: Implementación de la comunicación con la API de Star Wars.
    domain: Capa de dominio.
        entity: Entidades de dominio, como la clase Personaje.
        usecase: Casos de uso de la aplicación, como GetPersonajes.
        repositories: Repositorios que gestionan la obtención de datos.
    presentation: Capa de presentación.
        provider: Proveedores de estado utilizando provider.
            cubo_page: Página de visualización del logo del cubo, con un ChangeNotifier que gestiona el estado del logo.
            personajes_page: Página principal que muestra la lista de personajes, con un ChangeNotifier para gestionar el estado de los personajes.
        widgets: Componentes reutilizables, como PersonajeInfoDetalles y PersonajeItemLoading.
    test: Carpeta que contiene pruebas de widgets para asegurar la calidad del código.

Instrucciones de Uso

    Al abrir la aplicación, se mostrará una lista inicial de personajes de Star Wars.
    El usuario puede desplazarse hacia abajo para ver más personajes.
    Para filtrar los personajes por género, el usuario puede seleccionar una de las opciones disponibles.
    El filtro se mantendrá durante el desplazamiento de la lista, pero puede limpiarse en cualquier momento.
    Los usuarios pueden visualizar más personajes haciendo un gesto swipe-up sobre la pantalla.
    El logo del aplicativo, un cubo, estará presente en el centro superior de la pantalla y girará reactivamente a los movimientos giratorios del dispositivo.

Contribuciones

¡Las contribuciones son bienvenidas! Para contribuir con el desarrollo del aplicativo, sigue estos pasos:

    Revisa las ramas sobre las cuales se realizaron los desarrollos.
    Realiza tus cambios en una rama separada y específica para la tarea que estés realizando.
    Envía tus contribuciones a través de pull requests.

Notas

    Este aplicativo utiliza la API de SWAPI para obtener los datos de los personajes de Star Wars.
    Se ha utilizado solo los paquetes http versión 0.13.5 y provider 6.1.2 para el desarrollo.
    Este README.md proporciona una visión general de la estructura y características del aplicativo, pero se recomienda revisar el código fuente para obtener más detalles de implementación.

¡Gracias por utilizar nuestro aplicativo de personajes de Star Wars! Si tienes alguna pregunta o sugerencia, no dudes en ponerte en contacto con nosotros. ¡Que la fuerza te acompañe!