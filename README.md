# Neon Ui

[![License: MIT][license_badge]][license_link]

A Flutter UI library inspired by Neon Vibes

## Installation 💻

**❗ In order to start using Neon Ui you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Install via `flutter pub add`:

```sh
dart pub add neon_ui
```

## Widgets

- [NeonButton](#neonbutton)
- [NeonCheckbox](#neoncheckbox)
- [NeonChip](#neonchip)
- [NeonCircularProgressIndicator](#neoncircularprogressindicator)
- [NeonContainer](#neoncontainer)
- [NeonDecoratedBox](#neondecoratedbox)
- [NeonDialog](#neondialog)
- [NeonDivider](#neondivider)
- [NeonIcon](#neonicon)
- [NeonIconButton](#neoniconbutton)
- [NeonPressable](#neonpressable)
- [NeonRadio](#neonradio)

### NeonButton

A neon styled button widget with primary and secondary variants.

```dart
NeonButton(
  onPressed: () => print('Pressed'),
  child: Text('Click me'),
)
```

### NeonCheckbox

A checkbox widget with neon styling.

```dart
NeonCheckbox(
  value: isChecked,
  onChanged: (value) => setState(() => isChecked = value ?? false),
)
```

### NeonChip

A chip widget with neon styling and a mild glow effect.

```dart
NeonChip(
  label: 'Chip',
)
```

### NeonCircularProgressIndicator

A circular progress indicator widget with neon glow effect. When `value` is null (the default), the indicator shows an endless animation. When `value` is provided (0.0 to 1.0), it shows a determinate progress.

```dart
// Endless animation (default)
NeonCircularProgressIndicator(
  color: Colors.blue,
)

// Determinate progress
NeonCircularProgressIndicator(
  color: Colors.blue,
  value: 0.7,
)
```

### NeonContainer

A container widget with neon styling.

```dart
NeonContainer(
  child: Text('Content'),
)
```

### NeonDecoratedBox

A container that applies neon decoration to its child.

```dart
NeonDecoratedBox(
  child: Text('Decorated'),
)
```

### NeonDialog

A dialog widget with neon styling. Includes helper methods for showing dialogs and confirmation dialogs.

```dart
NeonDialog.show(
  context: context,
  builder: (context) => Text('Dialog content'),
)
```

### NeonDivider

A divider widget with neon styling.

```dart
NeonDivider()
```

### NeonIcon

A widget that displays a neon-styled icon.

```dart
NeonIcon(
  icon: Icons.star,
)
```

### NeonIconButton

A button that displays a neon-styled icon.

```dart
NeonIconButton(
  icon: Icons.settings,
  onPressed: () => print('Settings'),
)
```

### NeonPressable

A widget that provides neon pressable effects with opacity changes on press.

```dart
NeonPressable(
  onPressed: () => print('Pressed'),
  child: Text('Press me'),
)
```

### NeonRadio

A radio button widget with neon styling.

```dart
NeonRadio(
  value: isSelected,
  onChanged: (value) => setState(() => isSelected = value ?? false),
)
```

## Full widget catalog:

You can find a Widgetbook Catalog with the widget from this package here: https://neon-ui.pages.dev/

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT