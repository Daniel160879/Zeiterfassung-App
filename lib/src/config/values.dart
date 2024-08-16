/*import 'package:akademie_companion/src/config/assets.dart';
import 'package:akademie_companion/src/features/achievement/domain/badge_data.dart';
import 'package:akademie_companion/src/features/achievement/domain/expert_progress.dart';
import 'package:akademie_companion/src/features/achievement/domain/expert_topic.dart';
import 'package:akademie_companion/src/features/schedule/domain/curriculum_day.dart';
import 'package:akademie_companion/src/features/schedule/domain/schedule.dart';
import 'package:akademie_companion/src/features/schedule/domain/schedule_day.dart';
import 'package:timezone/timezone.dart' as tz;

const bool kUseEmulators = true;
//on ios the local host address is 127.0.0.1, in android emulator it's 10.0.2.2
const String kEmulatorsLocalhostAddress = "10.0.2.2";
//"192.168.0.104"; // "10.0.2.2"; //"192.168.0.104"; //"127.0.0.1";
const int kEmulatorsAuthenticationPort = 9099;
const int kEmulatorsFunctionsPort = 5001;
const int kEmulatorsFirestorePort = 8080;
const int kEmulatorsStoragePort = 9199;

/// in seconds
const int kResendVerificationEmailTimeout = 60;

/// in seconds
const int kResendPasswordRecoveryEmailTimeout = 60;

const String kHelpKitUrl = "https://appakademie.helpkit.so/";

/// The initial expert progress for a new user.
/// Contains all topics of the expert course.
/// TODO: remove this when the expert progress is stored in the production database
const kInitialExpertProgress = ExpertProgress(
  version: "1.0.0",
  topics: [
    ExpertTopic(
      name: "Binary Code",
      description: "Steuerung von Computern durch binäre Codes",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.3.1',
    ),
    ExpertTopic(
      name: "Softwarearten",
      description: "Ordne der Software die richtige Kategorie zu",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.3.2',
    ),
    ExpertTopic(
      name: "Binary Code II",
      description: "Steuerung von Computern durch binäre Codes",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.3.3',
    ),
    ExpertTopic(
      name: "Frontend vs. Backend",
      description: "Ordne den Features die richtige Kategorie zu",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.3.4',
    ),
    ExpertTopic(
      name: "Ideenfindung",
      description: "Welche Apps lösen diese Probleme?",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.3.5',
    ),
    ExpertTopic(
      name: "Ausbaustufen",
      description: "Ordne den Features die richtige Kategorie zu",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.4.1',
    ),
    ExpertTopic(
      name: "Projektablauf",
      description: "Ordne die Aktionen den richtigen Projektphasen zu",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.4.2',
    ),
    ExpertTopic(
      name: "Anforderungen",
      description:
          "Unterscheide zwischen funktionalen und nicht-funktionalen Anforderungen",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.4.3',
    ),
    ExpertTopic(
      name: "Branchen",
      description: "Finde Apps für die verschiedenen Branchen",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.5.1',
    ),
    ExpertTopic(
      name: "Karol",
      description: "Löse die Karol Aufgaben",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.5.3',
    ),
    ExpertTopic(
      name: "Konstruktives Feedback",
      description: "Gib konstruktives Feedback zu dem Pitch",
      type: ExpertTopicType.miniTask,
      chapter: 1,
      curriculumDayNumber: '1.5.4',
    ),
    ExpertTopic(
      // TODO: replace with real data for K2
      name: "Design Thinking",
      description: "Stelle dein Desing Thinking Wissen unter Beweis",
      type: ExpertTopicType.projectSheet,
      chapter: 2,
      curriculumDayNumber: "2.2.2",
    ),
    ExpertTopic(
      name: "Laufzeitvereinfachung",
      description: "Wie werden Ausdrücke zur Laufzeit ausgewertet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.2.2",
    ),
    ExpertTopic(
      name: "Algorithmus (Ablaufplan)",
      description: "Was ist ein Algorithmus und wie erstelle ich einen?",
      type: ExpertTopicType.projectSheet,
      chapter: 3,
      curriculumDayNumber: "3.2.4",
    ),
    ExpertTopic(
      name: "Primitive Datentypen",
      description:
          "Was sind primitive Datentypen und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.3.2",
    ),
    ExpertTopic(
      name: "Variablen",
      description: "Was sind Variablen und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.3.3",
    ),
    ExpertTopic(
      name: "Listen und Maps",
      description:
          "Wie füge ich Elemente zu einer Liste hinzu? Wie greife ich auf Elemente zu? Was sind Maps und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.3.4",
    ),
    ExpertTopic(
      name: "Arithmetische Operatoren",
      description:
          "Was sind arithmetische Operatoren und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.4.1",
    ),
    ExpertTopic(
      name: "Logische / Rel. Operatoren",
      description:
          "Was sind logische und relative Operatoren und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.4.2",
    ),
    ExpertTopic(
      name: "Zuweisungsoperatoren",
      description:
          "Was sind Zuweisungsoperatoren und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.4.3",
    ),
    ExpertTopic(
      name: "Switch",
      description: "Was ist ein Switch-Case und wie wird er verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.4.4",
    ),
    ExpertTopic(
      name: "Schleifen I",
      description: "Was sind Schleifen und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.4.5",
    ),
    ExpertTopic(
      name: "Einfaches Konsoleprogramm",
      description: "Erstelle ein einfaches Konsolenprogramm",
      type: ExpertTopicType.projectSheet,
      chapter: 3,
      curriculumDayNumber: "3.4.6",
    ),
    ExpertTopic(
      name: "Schleifen II",
      description: "Was sind Schleifen und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.5.1",
    ),
    ExpertTopic(
      name: "Funktionen I",
      description: "Was sind Funktionen und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.5.2",
    ),
    ExpertTopic(
      name: "Funktionen II",
      description: "Was sind Funktionen und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.5.3",
    ),
    ExpertTopic(
      name: "Funktionen III",
      description: "Was sind Funktionen und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.5.4",
    ),
    ExpertTopic(
      name: "Komplexes Konsolenprogramm",
      description: "Erstelle ein komplexes Konsolenprogramm",
      type: ExpertTopicType.projectSheet,
      chapter: 3,
      curriculumDayNumber: "3.5.4",
    ),
    ExpertTopic(
      name: "Klassen",
      description: "Was sind Klassen? Wie erstelle ich Klassen?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.6.1",
    ),
    ExpertTopic(
      name: "Objekte und Konstruktoren",
      description: "Was sind Klassen und wie erstelle ich Instanzen davon?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.6.2",
    ),
    ExpertTopic(
      name: "Vererbung",
      description: "Was ist Vererbung und wie wird sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.6.3",
    ),
    ExpertTopic(
      name: "Abstrakte Klassen",
      description: "Was ist eine abstrakte Klasse und wie wird sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 3,
      curriculumDayNumber: "3.6.4",
    ),
    ExpertTopic(
      name: "Database Repository",
      description:
          "Erstelle ein abstraktes DatabaseRepository, sowie eine Mock-Implementierung",
      type: ExpertTopicType.projectSheet,
      chapter: 3,
      curriculumDayNumber: "3.6.5",
    ),
    ExpertTopic(
      name: "Wissenscheck K3",
      description: "Teste dein Wissen zu den Themen des Kapitels 3",
      type: ExpertTopicType.exam,
      chapter: 3,
      curriculumDayNumber: "3.6.5",
    ),

    // ### Kapitel 4 ###
    ExpertTopic(
      name: "Hello World",
      description: "Erstelle eine Hello World App",
      type: ExpertTopicType.projectSheet,
      chapter: 4,
      curriculumDayNumber: "4.2.4",
    ),
    ExpertTopic(
      name: "Stateless Widgets",
      description: "Erstelle eigene Stateless Widgets",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.3.1",
    ),
    ExpertTopic(
      name: "Scaffold / Text / Container",
      description: "Erstelle eigene Stateless Widgets",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.3.2",
    ),
    ExpertTopic(
      name: "Row / Column / Main / Cross Axis",
      description: "Was sind Rows und Columns und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.3.3",
    ),
    ExpertTopic(
      name: "Stateful Widget state manipulieren",
      description: "Wie manipuliere ich den State eines Stateful Widgets?",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.3.4",
    ),
    ExpertTopic(
      name: "Erster Flutter Screen",
      description: "Erstelle den ersten Flutter Screen",
      type: ExpertTopicType.projectSheet,
      chapter: 4,
      curriculumDayNumber: "4.3.5",
    ),
    ExpertTopic(
      name: "ListView aus Liste",
      description: "Erstelle eine ListView aus einer Liste von Elementen",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.4.1",
    ),
    ExpertTopic(
      name: "Advanced Widgets I",
      description: "Erstelle fortgeschrittene Widgets",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.4.2",
    ),
    ExpertTopic(
      name: "Advanced Widgets II",
      description: "Erstelle fortgeschrittene Widgets",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.4.3",
    ),
    ExpertTopic(
      name: "Custom Widget",
      description: "Erstelle ein eigenes Custom Widget",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.4.4",
    ),
    ExpertTopic(
      name: "Bildergalerie",
      description: "Erstelle eine Bildergalerie App",
      type: ExpertTopicType.projectSheet,
      chapter: 4,
      curriculumDayNumber: "4.4.5",
    ),
    ExpertTopic(
      name: "Navigation Stack",
      description: "Was ist ein Navigation Stack und wie wird er verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.5.1",
    ),
    ExpertTopic(
      name: "Projektstruktur",
      description:
          "Wie sollte die Ordnerstruktur eines Flutter Projekts aussehen?",
      type: ExpertTopicType.miniTask,
      chapter: 4,
      curriculumDayNumber: "4.5.2",
    ),
    ExpertTopic(
      name: "JP Screens",
      description: "Erstelle die JP Screens",
      type: ExpertTopicType.projectSheet,
      chapter: 4,
      curriculumDayNumber: "4.6.1",
    ),
    ExpertTopic(
      name: "Eigene MVP Screens",
      description: "Erstellen eigene MVP Screens",
      type: ExpertTopicType.projectSheet,
      chapter: 4,
      curriculumDayNumber: "4.7.1",
    ),
    ExpertTopic(
      name: "Wissenscheck K4",
      description: "Teste dein Wissen zu den Themen des Kapitels 4",
      type: ExpertTopicType.exam,
      chapter: 4,
      curriculumDayNumber: "4.7.9",
    ),
    // ### Kapitel 5 ###
    ExpertTopic(
      name: "Dirty Code",
      description: "Wie erstelle ich wiederverwendbaren und sauberen Code?",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.1.1",
    ),
    ExpertTopic(
      name: "Lifecycle",
      description: "Was ist der Lifecycle eines Stateful Widgets?",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.1.2",
    ),
    ExpertTopic(
      name: "Input Validation",
      description: "Wie validiere ich Benutzereingaben?",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.1.4",
    ),
    ExpertTopic(
      name: "Future / await",
      description: "Was sind Futures und wie verwende ich await?",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.2.2",
    ),
    ExpertTopic(
      name: "FutureBuilder 3 States",
      description: "Was sind die 3 States eines FutureBuilders?",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.2.3",
    ),
    ExpertTopic(
      name: "Async / Await",
      description: "Was sind Async und Await und wie werden sie verwendet?",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.2.4",
    ),
    ExpertTopic(
      name: "Async Funktionen",
      description: "Bearbeite synchronen Code und mache ihn asynchron",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.2.5",
    ),
    ExpertTopic(
      name: "Database Repository Async",
      description: "Bearbeite das Database Repository und mache es async",
      type: ExpertTopicType.projectSheet,
      chapter: 5,
      curriculumDayNumber: "5.2.5",
    ),
    ExpertTopic(
      name: "SharedPrefs",
      description: "Wie verwende ich Shared Preferences?",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.3.3",
    ),
    ExpertTopic(
      name: "Persistente Checkliste",
      description: "Erstelle eine persistente Checkliste",
      type: ExpertTopicType.projectSheet,
      chapter: 5,
      curriculumDayNumber: "5.3.4",
    ),
    ExpertTopic(
      name: "JSON Aufbau",
      description: "Wie ist ein JSON aufgebaut?",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.4.1",
    ),
    ExpertTopic(
      name: "JSON String to Map / Data class Object",
      description: "Wie konvertiere ich einen JSON String in ein Objekt?",
      type: ExpertTopicType.miniTask,
      chapter: 5,
      curriculumDayNumber: "5.4.3",
    ),
    ExpertTopic(
      name: "API App",
      description: "Erstelle eine App, die eine API verwendet",
      type: ExpertTopicType.projectSheet,
      chapter: 5,
      curriculumDayNumber: "5.4.4",
    ),
    ExpertTopic(
      name: "Wissenscheck K5",
      description: "Teste dein Wissen zu den Themen des Kapitels 5",
      type: ExpertTopicType.exam,
      chapter: 5,
      curriculumDayNumber: "5.4.5",
    ),
    // ### Kapitel 6 ###
    ExpertTopic(
      name: "StreamBuilder 3 States",
      description: "Was sind die 3 States eines StreamBuilders?",
      type: ExpertTopicType.miniTask,
      chapter: 6,
      curriculumDayNumber: "6.1.2",
    ),
    ExpertTopic(
      name: "Firebase Auth",
      description: "Binde Firebase Auth in deine App ein",
      type: ExpertTopicType.projectSheet,
      chapter: 6,
      curriculumDayNumber: "6.1.3",
    ),
    ExpertTopic(
      name: "Firestore",
      description: "Zugriff auf Daten in Dokumenten und Collections",
      type: ExpertTopicType.miniTask,
      chapter: 6,
      curriculumDayNumber: "6.2.1",
    ),
    ExpertTopic(
      name: "Firestore Queries",
      description:
          "Zugriff und Bearbeitung von Daten in Dokumenten und Collections",
      type: ExpertTopicType.miniTask,
      chapter: 6,
      curriculumDayNumber: "6.2.2",
    ),
    ExpertTopic(
      name: "Rules",
      description: "Wie erstelle ich Firestore Security Rules?",
      type: ExpertTopicType.miniTask,
      chapter: 6,
      curriculumDayNumber: "6.2.3",
    ),
    ExpertTopic(
      name: "Backend Checklisten App",
      description: "Ziehe deine Checklisten App auf Firestore um",
      type: ExpertTopicType.projectSheet,
      chapter: 6,
      curriculumDayNumber: "6.2.4",
    ),
    ExpertTopic(
      name: "Firestore Repository",
      description: "Ersetze dein MockRepository durch ein FirestoreRepository",
      type: ExpertTopicType.projectSheet,
      chapter: 6,
      curriculumDayNumber: "6.2.5",
    ),
    ExpertTopic(
      name: "Provider Read vs. Watch",
      description: "Was ist der Unterschied zwischen Read und Watch?",
      type: ExpertTopicType.miniTask,
      chapter: 6,
      curriculumDayNumber: "6.3.3",
    ),
    ExpertTopic(
      name: "Provider",
      description: "Binde Provider in deine App ein",
      type: ExpertTopicType.projectSheet,
      chapter: 6,
      curriculumDayNumber: "6.3.3",
    ),
    ExpertTopic(
      name: "Provider ChangeNotifier",
      description: "Wie verwende ich Provider mit ChangeNotifier?",
      type: ExpertTopicType.miniTask,
      chapter: 6,
      curriculumDayNumber: "6.3.4",
    ),
    ExpertTopic(
      name: "Wissenscheck K6",
      description: "Teste dein Wissen zu den Themen des Kapitels 6",
      type: ExpertTopicType.exam,
      chapter: 6,
      curriculumDayNumber: "6.3.5",
    ),
    // ### Kapitel 7 ###
    ExpertTopic(
      name: "Flutter Web App CV",
      description: "Erstelle eine Flutter Web App für deinen Lebenslauf",
      type: ExpertTopicType.projectSheet,
      chapter: 7,
      curriculumDayNumber: "7.1.1",
    ),
    ExpertTopic(
      name: "Coding Challenge",
      description: "Löse die Coding Challenge",
      type: ExpertTopicType.exam,
      chapter: 7,
      curriculumDayNumber: "7.2.5",
    ),
    // we dont store this in the database, but calculate it from the other topics
    // ExpertTopic(
    //   name: "Akademie Expert",
    //   description:
    //       "Sammle alle Badges und löse alle Mini Tasks ein zweites Mal!",
    //   type: ExpertTopicType.akademieExpert,
    //   chapter: null,
    // ),
  ],
);

const ExpertTopic kAkademieExpert = ExpertTopic(
  name: "Akademie Expert",
  description: "Sammle alle Badges und löse alle Mini Tasks ein zweites Mal!",
  type: ExpertTopicType.akademieExpert,
  chapter: null,
  curriculumDayNumber: null,
);

const int kMinPwLength = 8;
const int kMaxPwLength = 40;

final List<BadgeData> templateBadges = [
  BadgeData(
    chapter: 1,
    title: 'App Ökosystem Experte',
    subtitle: 'Kapitel 1: App Ökosystem',
    description:
        'In diesem Kapitel lernst du die Grundlagen des App Ökosystems kennen und verstehst, wie Apps aufgebaut sind.',
    imagePath: Assets.badge1,
  ),
  BadgeData(
    chapter: 2,
    title: 'UI & UX Essentials',
    subtitle: 'Kapitel 2: UX & UI Design',
    description:
        'In diesem Kapitel lernst du die Grundlagen von User Experience und User Interface Design kennen.',
    imagePath: Assets.badge2,
  ),
  BadgeData(
    chapter: 3,
    title: 'Coding Fundamentals',
    subtitle: 'Kapitel 3: Coding Basic',
    description:
        'In diesem Kapitel lernst du die Grundlagen des Programmierens kennen und verstehst, wie Code funktioniert.',
    imagePath: Assets.badge3,
  ),
  BadgeData(
    chapter: 4,
    title: 'Flutter Bronze',
    subtitle: 'Kapitel 4: Flutter I',
    description:
        'In diesem Kapitel lernst du die Grundlagen von Flutter kennen und verstehst, wie Flutter Apps aufgebaut sind.',
    imagePath: Assets.badge4,
  ),
  BadgeData(
    chapter: 5,
    title: 'Flutter Silber',
    subtitle: 'Kapitel 5: Flutter II',
    description:
        'In diesem Kapitel lernst du fortgeschrittene Flutter Konzepte kennen und verstehst, wie Flutter Apps aufgebaut sind.',
    imagePath: Assets.badge5,
  ),
  BadgeData(
    chapter: 6,
    title: 'Flutter Gold',
    subtitle: 'Kapitel 6: Flutter III',
    description:
        'In diesem Kapitel lernst du fortgeschrittene Flutter Konzepte kennen und verstehst, wie Flutter Apps aufgebaut sind.',
    imagePath: Assets.badge6,
  ),
  BadgeData(
    chapter: 7,
    title: 'Ready for Takeoff',
    subtitle: 'Kapitel 7: Arbeitsmarktvorbereitung',
    description:
        'In diesem Kapitel bereiten wir dich auf den Arbeitsmarkt vor und zeigen dir, wie du dich optimal präsentierst.',
    imagePath: Assets.badge7,
    isSpecial: true,
  ),
  BadgeData(
    title: 'Akademie Expert',
    subtitle: 'Freiwillige Zusatzleistung',
    description: 'Sammle alle Badges und löse alle Mini Tasks ein zweites Mal!',
    imagePath: Assets.badgeAkademieExpert,
    isSpecial: true,
  ),
];

// TODO: remove this when this is implemented in the backend
Schedule buildScheduleTemplate(tz.Location location) {
  return Schedule(
    curriculumVersion: '3.1',
    courseStart: tz.TZDateTime(location, 0, 0, 0),
    courseEnd: tz.TZDateTime(location, 0, 0, 0),
    days: [
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Vorstellung, Ablauf & Vorbereitung',
          number: '1.1.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Selbstreflektion, Erwartungshaltung & Ziele',
          number: '1.2.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Startschuss + CSM',
          number: '1.2.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Entwicklermindset & ChatGPT',
          number: '1.2.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Persönliches Gespräch',
          number: '1.2.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Computer: Aufbau & Funktion',
          number: '1.3.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Software: Arten & Anwendung',
          number: '1.3.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Programmiersprachen',
          number: '1.3.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Computernetzwerke',
          number: '1.3.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Ideenfindung',
          number: '1.3.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Ausbaustufen',
          number: '1.4.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektablauf',
          number: '1.4.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Anforderungen & Use Cases',
          number: '1.4.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektmanagement',
          number: '1.4.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Ablaufplan & Ausbaustufen',
          number: '1.4.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Relevanz & Branchen',
          number: '1.5.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Präsentationsformen',
          number: '1.5.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Jobfelder + CSM',
          number: '1.5.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Pitch Erstellung + CSM',
          number: '1.5.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 1,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Pitch Vorstellung',
          number: '1.5.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Konzeption vs. Design',
          number: '2.1.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'UX vs. UI',
          number: '2.1.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Designablauf',
          number: '2.1.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Figma I',
          number: '2.1.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Figma II',
          number: '2.1.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Konkurrenzanalyse',
          number: '2.2.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'User Interviews',
          number: '2.2.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Personas & Zielgruppen',
          number: '2.2.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'User Stories',
          number: '2.2.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektarbeit',
          number: '2.2.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Gestaltungsprinzipien',
          number: '2.3.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Android vs iOS',
          number: '2.3.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Styling Attribute',
          number: '2.3.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Moodboard & Style Guide',
          number: '2.3.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektarbeit',
          number: '2.3.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Components & UI-Elemente',
          number: '2.4.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'LoFi & MidFi Wireframes',
          number: '2.4.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Mockups & HiFi Wireframes I',
          number: '2.4.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Mockups & HiFi Wireframes II',
          number: '2.4.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektarbeit',
          number: '2.4.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Designübergabe',
          number: '2.5.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Prototyping I',
          number: '2.5.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Prototyping II',
          number: '2.5.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Prototyping III',
          number: '2.5.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 2,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Abschlusspräsentation',
          number: '2.5.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'VSCode Installation',
          number: '3.1.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'GitHub Basics',
          number: '3.1.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Allgemein',
          number: '3.2.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Laufzeit',
          number: '3.2.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Algorithmus Beispiele (Dart)',
          number: '3.2.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Programmablaufpläne',
          number: '3.2.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Eigener Algorithmus',
          number: '3.2.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Syntax & Anweisungen',
          number: '3.3.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Primitive Datentypen (Dart)',
          number: '3.3.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Variablen & Konstanten (Dart)',
          number: '3.3.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Komplexe Datentypen (Dart)',
          number: '3.3.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Operatoren I (Dart)',
          number: '3.4.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Operatoren II (Dart)',
          number: '3.4.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Operatoren III (Dart)',
          number: '3.4.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Switch Anweisung (Dart)',
          number: '3.4.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Schleifen I (Dart)',
          number: '3.4.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Erstes Konsolenprogramm (Dart)',
          number: '3.4.6',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Schleifen II (Dart)',
          number: '3.5.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Funktionen I (Dart)',
          number: '3.5.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Funktionen II (Dart)',
          number: '3.5.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Funktionen III (Dart)',
          number: '3.5.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Komplexes Konsolenprogramm (Dart)',
          number: '3.5.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Klassen Einleitung',
          number: '3.6.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Objekte & Konstruktoren',
          number: '3.6.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Vererbung',
          number: '3.6.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Abstrakte Klassen & Implements',
          number: '3.6.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 3,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Database Repository (abstract)',
          number: '3.6.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Dart Recap I',
          number: '4.1.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Dart Recap II',
          number: '4.1.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Dart Recap III',
          number: '4.1.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: '”Hello Flutter”',
          number: '4.2.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Setup',
          number: '4.2.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Task App Intro',
          number: '4.2.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: '”Hello World” Flutter App',
          number: '4.2.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Stateless Widgets',
          number: '4.3.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Widgets I',
          number: '4.3.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Widgets II',
          number: '4.3.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Stateful Widgets',
          number: '4.3.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Erster Flutter Screen Vorstellung',
          number: '4.3.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Widgets III',
          number: '4.4.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Widgets IV',
          number: '4.4.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Widgets V',
          number: '4.4.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Custom Widgets',
          number: '4.4.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Bildergalerie App',
          number: '4.4.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Navigation',
          number: '4.5.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektstruktur',
          number: '4.5.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Allgemein + JP-App',
          number: '4.6.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Themes & Dark/Light-Mode + JP-App',
          number: '4.6.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Packages, Pub.dev & Assets + JP-App',
          number: '4.6.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'App Icon & Splash Screen + JP-App',
          number: '4.6.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Zentrales App Theme + JP-App',
          number: '4.6.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektstruktur und DB Repo',
          number: '4.7.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Auth Screens / Textfields',
          number: '4.7.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'App Icon / Splash / AppName / Readme.md',
          number: '4.7.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Navigation Bar',
          number: '4.7.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Theme, TextTheme',
          number: '4.7.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'App Puffertag',
          number: '4.7.6',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Drawer',
          number: '4.7.7',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Präsentationen der MVP Screens',
          number: '4.7.8',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 4,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Flexible und Expanded',
          number: '4.7.9',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Input Validation',
          number: '5.1.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Synchron vs Asynchron',
          number: '5.2.1',
        ),
      ),

      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Futures I',
          number: '5.2.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Futures II',
          number: '5.2.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Async/Await',
          number: '5.2.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Async DB Repo',
          number: '5.2.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Persistierung',
          number: '5.3.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Datenbank Arten',
          number: '5.3.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Shared Preferences',
          number: '5.3.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Persistente Checklisten App I',
          number: '5.3.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Persistente Checklisten App II',
          number: '5.3.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Serveranfragen: Aufbau & Ablauf',
          number: '5.4.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'APIs',
          number: '5.4.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'HTTP-Client',
          number: '5.4.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'API App',
          number: '5.4.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'API App Vorstellung',
          number: '5.4.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektwoche',
          number: '5.5.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektwoche',
          number: '5.5.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektwoche',
          number: '5.5.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektwoche',
          number: '5.5.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 5,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Projektwoche',
          number: '5.5.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Auth Mechanismen',
          number: '6.1.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Streams',
          number: '6.1.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Firebase Authentication',
          number: '6.1.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Social Logins',
          number: '6.1.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Authentication Flow',
          number: '6.1.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Firestore I',
          number: '6.2.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Firestore II',
          number: '6.2.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Firestore III',
          number: '6.2.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Backend Checklisten App',
          number: '6.2.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Eigene Firestore Anbindung',
          number: '6.2.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'State',
          number: '6.3.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'State Management Solutions',
          number: '6.3.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Provider I',
          number: '6.3.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Provider II',
          number: '6.3.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Provider in eigener App',
          number: '6.3.5',
        ),
      ),
      // bloatDay
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 6,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Abschlussprojekt',
          number: '6.6.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Flutter Web & Hosting',
          number: '7.1.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Breakpoints',
          number: '7.1.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Portfolio Aufbau',
          number: '7.1.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Retrospektive & Glossar',
          number: '7.2.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Vorstellungsgespräche',
          number: '7.2.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Aktiv Zuhören & Fragen stellen',
          number: '7.2.3',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Technische Interviews',
          number: '7.2.4',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Coding Challenges',
          number: '7.2.5',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Job-Plattformen',
          number: '7.2.6',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Job-Felder',
          number: '7.2.7',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Recruiting Perspektive',
          number: '7.2.8',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Next Steps',
          number: '7.2.9',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Demo Day I',
          number: '7.3.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Demo Day II',
          number: '7.3.2',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Abschlussgespräche I',
          number: '7.4.1',
        ),
      ),
      ScheduleDay(
        date: tz.TZDateTime(location, 0, 0, 0),
        chapter: 7,
        type: ScheduleDayType.classDay,
        curriculumDay: const CurriculumDay(
          title: 'Abschlussgespräche II',
          number: '7.4.2',
        ),
      ),
    ],
  );
}

List<DateTime> getHolidaysBerlin(tz.Location location) => [
      tz.TZDateTime(location, 2000, 1, 1),
      tz.TZDateTime(location, 2000, 3, 8),
      tz.TZDateTime(location, 2000, 3, 29),
      tz.TZDateTime(location, 2000, 4, 1),
      tz.TZDateTime(location, 2000, 5, 1),
      tz.TZDateTime(location, 2000, 5, 9),
      tz.TZDateTime(location, 2000, 5, 20),
      tz.TZDateTime(location, 2000, 10, 3),
      tz.TZDateTime(location, 2000, 12, 25),
      tz.TZDateTime(location, 2000, 12, 26),
    ];*/
