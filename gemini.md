code

Markdown

\# Master-Prompt: Bau der "Moritz Coach" Fitness Plattform



\*\*Projektübersicht:\*\*

Wir bauen eine komplette Fitness-Coaching-Plattform als eine einzige Flutter-Anwendung. Die App wird zwei unterschiedliche Benutzererfahrungen basierend auf der Benutzerrolle (`client` vs. `admin`) bieten, alles innerhalb derselben Codebasis. Das Backend ist Firebase (Firestore, Authentication). Die App wird detaillierte Trainingsplanung, Live-Workout-Tracking, Leistungsanalyse und robuste Admin-Kontrollen umfassen.



\*\*Anleitung:\*\*

Verwende die Prompts für jede Aufgabe in diesem Dokument schrittweise. Kopiere einen Task-Prompt, füge ihn in den Gemini-Chat ein, warte auf die Fertigstellung und fahre dann mit dem nächsten fort.



---



\## Phase 1: Projekt-Setup \& Fundament



\*\*Ziel:\*\* Das Projekt erstellen, Firebase konfigurieren, alle notwendigen Abhängigkeiten hinzufügen und eine saubere Ordnerstruktur etablieren.



---



\### ▶️ Task 1.1: Projekt erstellen

Hallo Gemini, wir werden eine komplette Fitness-Coaching-App bauen.

Als Erstes, lass uns das Projekt aufsetzen. Bitte führe den Befehl aus, um ein neues Flutter-Projekt in meinem aktuellen Verzeichnis namens trainings\_app zu erstellen.

code

Code

---



\### ▶️ Task 1.2: Firebase konfigurieren

Ausgezeichnet. Jetzt lass uns Firebase konfigurieren. Bitte führe den flutterfire configure-Befehl aus und leite mich durch den Prozess der Auswahl meines Firebase-Projekts und der Plattformen, die wir unterstützen werden (Android, iOS, Web).

code

Code

---



\### ▶️ Task 1.3: Abhängigkeiten hinzufügen

Firebase ist konfiguriert. Bitte ersetze jetzt den gesamten dependencies- und dev\_dependencies-Bereich meiner pubspec.yaml-Datei mit dem folgenden Code, um alle Pakete hinzuzufügen, die wir für das Projekt benötigen. Führe anschließend flutter pub get aus.

code

Code

```yaml

dependencies:

&nbsp; flutter:

&nbsp;   sdk: flutter



&nbsp; # Firebase

&nbsp; firebase\_core: ^2.32.0

&nbsp; cloud\_firestore: ^4.17.5

&nbsp; firebase\_auth: ^4.20.0



&nbsp; # State Management

&nbsp; flutter\_riverpod: ^2.5.1



&nbsp; # UI Packages

&nbsp; cupertino\_icons: ^1.0.8

&nbsp; table\_calendar: ^3.1.2

&nbsp; fl\_chart: ^0.68.0

&nbsp; vibration: ^1.9.0



&nbsp; # Data Modeling \& Utilities

&nbsp; freezed\_annotation: ^2.4.1

&nbsp; json\_annotation: ^4.9.0

&nbsp; collection: ^1.18.0

&nbsp; uuid: ^4.4.0



dev\_dependencies:

&nbsp; flutter\_test:

&nbsp;   sdk: flutter



&nbsp; # Code Quality

&nbsp; flutter\_lints: ^4.0.0



&nbsp; # Code Generation

&nbsp; build\_runner: ^2.4.11

&nbsp; freezed: ^2.5.2

&nbsp; json\_serializable: ^6.8.0

▶️ Task 1.4: Ordnerstruktur erstellen

code

Code

Jetzt lass uns eine saubere Ordnerstruktur innerhalb des `lib`-Verzeichnisses aufsetzen. Bitte erstelle die folgenden Unterverzeichnisse:

\- `models`

\- `providers`

\- `screens` (mit den Unterverzeichnissen `admin` und `client`)

\- `services`

\- `widgets` (mit den Unterverzeichnissen `admin` und `client`)

Phase 2: Datenmodelle \& Services

Ziel: Die gesamte Datenstruktur der Anwendung mit freezed definieren und den zentralen Service für die Datenbankkommunikation erstellen.

▶️ Task 2.1: Datenmodelle erstellen

code

Code

Es ist Zeit, unsere Datenmodelle zu erstellen. Für jedes der folgenden Modelle, erstelle bitte die entsprechende `.dart`-Datei im `lib/models`-Verzeichnis und befülle sie mit dem korrekten `freezed`-Boilerplate-Code.



1\.  \*\*`user\_model.dart`\*\* (für `UserModel`)

2\.  \*\*`exercise\_model.dart`\*\* (für `ExerciseModel` und `ExerciseTags`)

3\.  \*\*`workout\_template\_model.dart`\*\* (für `WorkoutTemplateModel`)

4\.  \*\*`day\_model.dart`\*\* (für `DayModel`)

5\.  \*\*`exercise\_in\_plan\_model.dart`\*\* (für `ExerciseInPlanModel`)

6\.  \*\*`workout\_set\_model.dart`\*\* (für `WorkoutSetModel`)

7\.  \*\*`workout\_log\_model.dart`\*\* (für `WorkoutLogModel` und `EditHistoryEntry`)

8\.  \*\*`client\_plan\_model.dart`\*\* (für `ClientPlanModel`)

9\.  \*\*`exercise\_stats\_model.dart`\*\* (für `ExerciseStats`)

10\. \*\*`admin\_attributes\_model.dart`\*\* (für `AdminAttributesModel`, `EquipmentType`, `ExerciseModifier`, `ModifierParameter`)



\*Nachdem du alle Dateien erstellt hast, gib mir den Befehl, um `build\_runner` auszuführen.\*

▶️ Task 2.2: Database Service erstellen

code

Code

Die Modelle sind definiert. Erstelle jetzt die Datei `lib/services/database\_service.dart`. Definiere eine Klasse `DatabaseService` darin. Lass die Klasse vorerst leer. Wir werden Methoden hinzufügen, während wir die Features bauen.

Phase 3: Authentifizierung \& Rollenbasiertes Routing

Ziel: Den Einstiegspunkt der App bauen, der es Benutzern ermöglicht, sich anzumelden oder zu registrieren, und sie dann basierend auf ihrer Rolle zur richtigen UI weiterleitet.

▶️ Task 3.1: Authentifizierungs-Screens bauen

code

Code

Lass uns den Authentifizierungs-Flow bauen.



1\.  Erstelle ein `LoginScreen`-Widget in `lib/screens/client/login\_screen.dart`. Es sollte ein `ConsumerStatefulWidget` mit TextFormFields für E-Mail/Passwort und einem Login-Button sein.

2\.  Erstelle ein `RegisterScreen`-Widget in `lib/screens/client/register\_screen.dart`. Es sollte ähnlich sein, aber ein zusätzliches `displayName`-Feld enthalten.

3\.  Füge die notwendigen Methoden für `signIn`, `register` und `getUser` zur `DatabaseService`-Klasse hinzu.

▶️ Task 3.2: Root-Navigation implementieren

code

Code

Implementiere jetzt die Haupt-Routing-Logik. Erstelle ein neues Root-Widget, `AuthWrapper`, das `FirebaseAuth.instance.authStateChanges()` verwendet, um den Auth-Status zu überwachen.

\- Wenn der Benutzer ausgeloggt ist, zeige den `LoginScreen`.

\- Wenn der Benutzer eingeloggt ist, hole sein `UserModel` aus Firestore.

&nbsp; - Zeige während des Ladens einen Ladeindikator.

&nbsp; - Wenn die `role` des Benutzers `'admin'` ist, zeige den `AdminMainScreen`.

&nbsp; - Wenn die `role` des Benutzers `'client'` ist, zeige den `ClientMainScreen`.

&nbsp; - Wenn der `status` des Benutzers `'pending'` ist, zeige einen `PendingApprovalScreen`.

Aktualisiere `main.dart`, um `AuthWrapper` als `home`-Widget zu verwenden.

Phase 4: Client- und Admin-UI bauen

Ziel: Alle Screens für beide Benutzertypen wie geplant ausbauen.

▶️ Task 4.1: Hauptstruktur für beide Rollen bauen

code

Code

Lass uns die Hauptstruktur für beide Benutzerrollen bauen.



1\.  Erstelle den `ClientMainScreen` mit einer `BottomNavigationBar`, die drei Tabs enthält: `Trainingspläne`, `Logbuch`, `Profil`.

2\.  Erstelle den `AdminMainScreen` mit einem `Drawer`, der Navigationspunkte für `Dashboard`, `Klienten`, `Übungs-Bibliothek`, `Trainingsplan-Vorlagen`, `Analyse` und `Attribute` enthält.

(Von hier aus würden Sie fortfahren, die Implementierung jedes Features einzeln anzufordern. Der folgende Task ist ein Beispiel.)

▶️ Task 4.2 (Beispiel): Admin Attribut-Verwaltung

code

Code

Lass uns den \*\*Attribut-Verwaltungs-Screen\*\* für den Admin bauen. Erstelle ein neues `StatefulWidget` namens `AttributeManagementScreen`. Es sollte Tabs haben, um `EquipmentTypes`, `MovementPatterns`, `MuscleGroups` und `ExerciseModifiers` zu verwalten. Implementiere die UI, um die Daten aus dem `admin\_attributes`-Dokument in Firestore zu laden und dem Admin zu erlauben, Einträge in jeder Liste hinzuzufügen, zu bearbeiten und zu löschen.

(Fahren Sie mit diesem Prozess für das Klienten-Management, die Übungs-Bibliothek, den manuellen TemplateEditor und schließlich die gesamte Client-Erfahrung inklusive dem LiveWorkoutScreen fort, indem Sie unsere detaillierte Konversation als Leitfaden verwenden.)

code

Code

