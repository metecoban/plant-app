# Plant App

A plant identification and care case study app. Includes an Onboarding → Paywall → Home flow, API integration, localization, and theme support.

**Repo:** [github.com/metecoban/plant-app](https://github.com/metecoban/plant-app)

## Screenshots

| Get Started | Onboarding 1 | Onboarding 2 |
| --- | --- | --- |
| ![Get Started](docs/screenshots/get_started.png) | ![Onboarding 1](docs/screenshots/onboaring_1.png) | ![Onboarding 2](docs/screenshots/onboaring_2.png) |

| Paywall | Home |
| --- | --- |
| ![Paywall](docs/screenshots/paywall.png) | ![Home](docs/screenshots/home.png) |

## Tech Stack

| Area | Package |
| --- | --- |
| State management | `flutter_bloc` |
| Navigation | `auto_route` |
| DI | `get_it`, `injectable` |
| Network | `dio` |
| Local storage | `shared_preferences` |
| i18n | `slang`, `slang_flutter` |
| Immutability / JSON | `freezed`, `json_serializable` |
| UI | `flutter_svg`, `cached_network_image`, `skeletonizer` |
| Logging | `talker_flutter`, `talker_dio_logger`, `talker_bloc_logger` |
| Code gen | `build_runner`, `auto_route_generator`, `injectable_generator`, `flutter_gen_runner` |
| Test | `flutter_test`, `mocktail` |

## Architecture

The project follows **feature-first Clean Architecture**. Each feature has its own `data`, `domain`, and `presentation` layers.

```
Presentation  →  UI, Bloc/Cubit, widgets
Domain        →  Entities, repository contracts, use cases
Data          →  Repository impl, data sources, models
```

**App flow:** After splash, onboarding/paywall completion state is read from `SharedPreferences`; `AppFlowCubit` determines the next screen.

**State management:** `Cubit` is used for simple UI state; `Bloc` is used for event-driven async flows (e.g. Home), depending on feature complexity.

**Cross-cutting concerns:** Shared infrastructure such as network, error handling, storage, i18n, and `BaseView` lives under `core/`.

## Folder Structure

```
lib/
├── app/                    # MaterialApp, router, theme, DI, app settings
│   ├── di/
│   ├── router/
│   ├── settings/
│   └── theme/
├── core/                   # Shared infrastructure
│   ├── config/
│   ├── error/
│   ├── i18n/
│   ├── logger/
│   ├── network/
│   ├── presentation/       # BaseView
│   └── storage/
├── features/
│   ├── app_flow/           # Splash, onboarding/paywall/home routing
│   ├── onboarding/
│   ├── paywall/
│   └── home/               # API, HomeBloc, main screen UI
├── gen/                    # flutter_gen (assets, fonts)
├── shared/                 # Shared widgets
└── main.dart

assets/
├── fonts/
├── icons/
├── i18n/                   # en.i18n.json, tr.i18n.json
└── images/

test/
├── core/
├── features/               # Unit, bloc/cubit, widget tests
└── helpers/
```

## Setup

**Requirements:** Flutter SDK `^3.12.2`, compatible Dart SDK.

```bash
git clone https://github.com/metecoban/plant-app.git
cd plant-app
flutter pub get
dart run slang
dart run build_runner build --delete-conflicting-outputs
flutter run
```

**API base URL** (default):

```
https://dummy-api-jtg6bessta-ey.a.run.app
```

For a different environment:

```bash
flutter run --dart-define=API_BASE_URL=https://your-api.example
```

## Code Generation

Parts of the project that rely on codegen:

| Purpose | Command |
| --- | --- |
| i18n (`slang`) | `dart run slang` |
| Router, DI, freezed, JSON | `dart run build_runner build --delete-conflicting-outputs` |
| Type-safe asset access | `flutter_gen_runner` via `build_runner` |

Full regeneration flow:

```bash
dart run slang
dart run build_runner build --delete-conflicting-outputs
```

## Running Tests

```bash
flutter test
```

With coverage:

```bash
flutter test --coverage
```

Test coverage includes: app flow, onboarding/paywall cubits, home repository & bloc, BaseView, and basic widget render scenarios.

## Analyze

```bash
flutter analyze
```

Recommended pre-commit checks:

```bash
dart format .
flutter analyze
flutter test
```

## Build

```bash
flutter build apk --release
```

iOS:

```bash
flutter build ios --release
```

## Architecture Decisions

- **Feature-first Clean Architecture** — features are isolated; the domain layer is independent of Flutter/UI.
- **`BaseView`** — reduces repetition of `BlocProvider` + `BlocBuilder` / `BlocConsumer` only; it does not carry business logic.
- **No `BaseCubit` or unnecessary base classes** — abstraction only where needed.
- **DI: `get_it` + `injectable`** — constructor injection, replaceable with mocks in tests.
- **App flow managed via local storage** — onboarding/paywall completion flags in `SharedPreferences`; theme and locale preferences are also stored locally.
- **Responsive design** — built with Flutter's native layout tools (`LayoutBuilder`, `MediaQuery`, `Flexible`, grid, padding constants); no extra responsive package.
- **Home uses `Bloc` + freezed union state** — loading / success / empty / failure handled with type-safe `switch`.
- **`Cubit` for simple screens** — e.g. onboarding page index, paywall plan selection.
- **API responses as JSON strings** — the backend returns unparsed JSON strings on some endpoints; resolved via `ResponseParser`.
- **i18n: slang** — type-safe translations; output in `lib/core/i18n/`.

## Known Limitations

- Paywall does **not** include real purchase / restore; it simulates UI and local flow completion.
- Diagnose, My Garden, and Scan tabs are **placeholder** screens (except profile settings).
- Premium banner, search, and scan FAB are **not wired to actions yet**.
- Tests use `mocktail` + manual state assertions because `bloc_test` is incompatible with the current dependency set (`freezed 4.x` + `flutter_bloc 9`).
- Network images use `cached_network_image`; offline scenarios are only partially tested.

## License

For case study purposes only; `publish_to: "none"`.
