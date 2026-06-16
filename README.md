# Todo App - Flutter

Een eenvoudige maar complete todo applicatie gebouwd met **Flutter** en **Dart**. Met deze app kun je taken toevoegen, bewerken, verwijderen en het verwijderen ongedaan maken – allemaal met een gebruikersinterface.

## Functionaliteiten

- **Taak toevoegen** – via een dialoogvenster met een tekstveld. Lege of alleen spaties bevattende taken worden geweigerd.
- **Taak bewerken** – klik op het blauwe potloodicoon om de tekst van een bestaande taak aan te passen.
- **Taak verwijderen** – klik op het rode prullenbakicoon. Na verwijdering verschijnt een snackbar met een **UNDO** knop waarmee je de verwijdering kunt herstellen.
- **Duurzame lijst** – taken blijven in het geheugen zolang de app actief is (geen persistente opslag, geschikt voor een demonstratie).
- **Eenvoudige, overzichtelijke UI** – gebruik van `Card`, `ListTile` en `IconButton` voor een nette uitstraling.

## Technologieën

- **Framework:** Flutter
- **Taal:** Dart
- **State Management:** `setState` (lokaal binnen de `StatefulWidget`)
- **Dialogs:** `AlertDialog` voor toevoegen/bewerken
- **Feedback:** `SnackBar` voor fouten en undo-acties

## Schermafbeeldingen

![Overzicht van de app](./todoapp/Todoapp_foto_1.png)
![Taak toevoegen](./todoapp/Todoapp_foto_2.png)
![Taak bewerken](./todoapp/Todoapp_foto_3.png)
![Taak verwijderen](./todoapp/Todoapp_foto_4.png)

## Aan de slag

### Vereisten

- Flutter SDK (≥3.0)
- Android Studio / VS Code
- Git

### Installatie

1. Clone de repository:
   ```bash
   git clone https://github.com/FkArA9708/todoapp.git
   cd todoapp
2. Installeer de dependencies:
   ```bash
   flutter pub get
3. Start de app:
   ```bash
   flutter run
4. Geniet van je nieuwe todo-app!

### Gebruik

- Tik op de Add knop onderaan en voer een taak in. Druk op OK om toe te voegen.

- Tik op het potloodicoon om een bestaande taak te bewerken. Pas de tekst aan en druk op OK.

- Tik op het prullenbakicoon om een taak te verwijderen. Er verschijnt een snackbar met UNDO. Klik hierop binnen 3 seconden om de verwijdering ongedaan te maken.

## Licentie

Dit project is bedoeld voor educatieve doeleinden en voor gebruik in een portfolio. Vrij te gebruiken en aan te passen.

## Auteur

- FkArA9708 - [GitHub](https://github.com/FkArA9708)