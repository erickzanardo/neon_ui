# AGENTS.md

## Project Overview

Neon UI is a Flutter UI library inspired by Neon Vibes.

## Key Commands

- **Run analysis:** `dart analyze`
- **Run formatter:** `dart format`
- **Run tests:** `dart test` or `flutter test`
- **Generate code:** `dart run build_runner build` (generates `.g.dart` files)
- **Run Widgetbook:** `cd widgetbook_catalog && flutter run`

## Code Conventions

- Uses [Very Good Analysis](https://pub.dev/packages/very_good_analysis) - do not disable lint rules
- Uses templates for documentation (e.g., `/// {@template name}` / `/// {@endtemplate}`)
- Follows standard Flutter/Dart conventions
- Prefer import from barrel files

## Project Structure

- `lib/src/widgets/` - Widget implementations
- `lib/src/theme/` - Theme extensions
- `widgetbook_catalog/` - Widgetbook catalog app

## Adding New Widgets

1. Create widget in `lib/src/widgets/`
2. Export from `lib/src/widgets/widgets.dart`
3. Add Widgetbook use case in `widgetbook_catalog/lib/`
4. Run `dart run build_runner build` to regenerate directories
5. **Update the Widgets section in README.md** - Add the widget to the index list (alphabetically ordered) and add a new section with its name (h3), description, and a code snippet example
