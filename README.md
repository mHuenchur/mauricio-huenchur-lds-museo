# Exploradores de Museo

Exploradores de Museo es una aplicación que invita a descubrir las piezas de un museo mediante misiones de búsqueda. El visitante sigue pistas en su celular, recorre las salas y demuestra que encontró la pieza correcta escaneando un código QR o tomando una fotografía. Cada museo puede adaptar los recorridos a su colección desde un panel de administración.

## Cómo se juega

1. **Elegir una misión.** El visitante inicia sesión con Google y explora las misiones disponibles. Puede consultar su descripción, dificultad y duración estimada. Algunas se desbloquean al completar una misión previa.
2. **Seguir la pista.** Cada desafío presenta una pista sobre una pieza del museo. Si el primer intento falla, el visitante puede consultar una pista adicional.
3. **Validar el hallazgo.** En un desafío con QR, el visitante escanea el código ubicado junto a la pieza. En un desafío con inteligencia artificial, toma una foto y la aplicación la compara con la imagen de referencia cargada por el museo.
4. **Avanzar en el recorrido.** Al resolver el desafío, el visitante suma puntos y accede al siguiente. La barra de progreso muestra cuánto lleva completado. Si interrumpe la visita, puede retomar la misión desde el desafío pendiente.
5. **Completar la misión.** Al finalizar, el visitante ve los puntos obtenidos y recibe una insignia si la misión tiene una asignada. Después puede consultar su historial de misiones completadas y su colección de insignias.

## Canje de recompensas

El visitante puede usar sus puntos para canjear recompensas del museo, como un llavero o un descuento. Al confirmar el canje, se descuentan los puntos y se reserva una unidad del stock. La aplicación genera un cupón que el visitante presenta al personal del museo. El administrador lo valida mediante su código o QR y registra la entrega. Cada cupón se puede utilizar una sola vez.

## Panel de administración

El personal autorizado puede gestionar la experiencia desde el navegador o el celular.

- **Misiones.** Crear, editar, duplicar y archivar recorridos, organizarlos por sala, activar su disponibilidad y elegir qué misión debe completarse para desbloquear otra.
- **Desafíos.** Definir el orden, redactar pistas, asignar puntos y elegir el método de validación. Para los desafíos con QR, se puede generar un PDF e imprimir el código para colocarlo junto a la pieza.
- **Insignias y recompensas.** Asociar insignias a las misiones y administrar las recompensas, su costo en puntos y el stock disponible.
- **Estadísticas.** Consultar la participación de los visitantes e identificar las misiones más jugadas.

## Tecnologías

| Tecnología | Uso en el proyecto |
| --- | --- |
| FlutterFlow, Flutter y Dart | Interfaz de la aplicación, cámara y acciones personalizadas. |
| Firebase Authentication | Inicio de sesión con Google. |
| Cloud Firestore | Almacenamiento de misiones, desafíos, progreso, puntos y canjes. |
| Firebase Storage | Almacenamiento de imágenes del museo y fotografías de los desafíos. |
| Google Gemini | Comparación de la foto del visitante con la imagen de referencia de la pieza. |

## Autor

Mauricio Huenchur · Proyecto académico LDS 2026.
