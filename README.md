Test Técnico para Desarrollador iOS

Objetivo: Desarrollar una aplicación nativa para iOS que utilice la API de iTunes
para mostrar información sobre las canciones más populares.

- iOS versión 16 o superior
- Utilizar la API de iTunes (https://itunes.apple.com/) para obtener un
listado de 10 canciones en las tiendas de Estados Unidos, Suecia y
Chile.
- Utiliza SWiftUI
- Maneja canciones favoritas en vistas separadas.
- La arquitectura utilizada en este código es MVVM (Model-View-ViewModel). La clase ApiManager representa el modelo, la estructura Song representa los datos que se muestran en la vista, y las clases SongsViewModel, FavoritesManager, SongsView y FavoritesView representan las vistas y los view models.
