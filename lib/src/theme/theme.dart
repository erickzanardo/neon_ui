import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template neon_container_theme}
/// Theme extension for neon container styles.
/// {@endtemplate}
class NeonContainerTheme extends ThemeExtension<NeonContainerTheme> {
  /// {@macro neon_container_theme}
  const NeonContainerTheme({
    this.padding = 16.0,
    this.backgroundColor = const Color(0xDD000000),
  });

  /// The padding inside the neon container.
  final double padding;

  /// The background color of the neon container.
  final Color backgroundColor;

  @override
  ThemeExtension<NeonContainerTheme> copyWith({
    double? padding,
    Color? backgroundColor,
  }) {
    return NeonContainerTheme(
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ThemeExtension<NeonContainerTheme> lerp(
    covariant ThemeExtension<NeonContainerTheme>? other,
    double t,
  ) {
    if (other is! NeonContainerTheme) {
      return this;
    }
    return NeonContainerTheme(
      padding: lerpDouble(padding, other.padding, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}

/// {@template neon_button_theme}
/// Theme extension for neon button styles.
/// {@endtemplate}
class NeonButtonTheme extends ThemeExtension<NeonButtonTheme> {
  /// {@macro neon_button_theme}
  const NeonButtonTheme({
    this.minHeight = 48.0,
    this.maxHeight,
    this.borderRadius = 8.0,
  });

  /// The height of the neon button.
  final double minHeight;

  /// The maximum height of the neon button.
  final double? maxHeight;

  /// The border radius of the neon button.
  final double borderRadius;

  @override
  ThemeExtension<NeonButtonTheme> copyWith({
    double? minHeight,
    double? maxHeight,
    double? borderRadius,
  }) {
    return NeonButtonTheme(
      minHeight: minHeight ?? this.minHeight,
      maxHeight: maxHeight ?? this.maxHeight,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<NeonButtonTheme> lerp(
    covariant ThemeExtension<NeonButtonTheme>? other,
    double t,
  ) {
    if (other is! NeonButtonTheme) {
      return this;
    }
    return NeonButtonTheme(
      minHeight: lerpDouble(minHeight, other.minHeight, t)!,
      maxHeight: lerpDouble(maxHeight, other.maxHeight, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
    );
  }
}

/// {@template neon_icon_theme}
/// Theme extension for neon icon styles.
/// {@endtemplate}
class NeonIconTheme extends ThemeExtension<NeonIconTheme> {
  /// {@macro neon_icon_theme}
  const NeonIconTheme({
    this.size = 32.0,
    this.padding = 8.0,
  });

  /// The size of the neon icon.
  final double size;

  /// The padding around the neon icon.
  final double padding;

  @override
  ThemeExtension<NeonIconTheme> copyWith({
    Color? color,
    double? size,
    double? padding,
  }) {
    return NeonIconTheme(
      size: size ?? this.size,
      padding: padding ?? this.padding,
    );
  }

  @override
  ThemeExtension<NeonIconTheme> lerp(
    covariant ThemeExtension<NeonIconTheme>? other,
    double t,
  ) {
    if (other is! NeonIconTheme) {
      return this;
    }
    return NeonIconTheme(
      size: lerpDouble(size, other.size, t)!,
      padding: lerpDouble(padding, other.padding, t)!,
    );
  }
}

/// {@template neon_decoration_config}
/// Configuration for neon decoration styles.
/// {@endtemplate}
class NeonDecorationConfig extends ThemeExtension<NeonDecorationConfig> {
  /// {@macro neon_decoration_config}
  const NeonDecorationConfig({
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.offset = 2,
    this.blurSigma = 4,
  });

  /// The border radius of the neon decoration.
  final double borderRadius;

  /// The border width of the neon decoration.
  final double borderWidth;

  /// The offset of the neon shadow.
  final double offset;

  /// The blur sigma of the neon shadow.
  final double blurSigma;

  @override
  ThemeExtension<NeonDecorationConfig> copyWith({
    double? borderRadius,
    double? borderWidth,
    double? offset,
    double? blurSigma,
  }) {
    return NeonDecorationConfig(
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      offset: offset ?? this.offset,
      blurSigma: blurSigma ?? this.blurSigma,
    );
  }

  @override
  ThemeExtension<NeonDecorationConfig> lerp(
    covariant ThemeExtension<NeonDecorationConfig>? other,
    double t,
  ) {
    if (other is! NeonDecorationConfig) {
      return this;
    }
    return NeonDecorationConfig(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      offset: lerpDouble(offset, other.offset, t)!,
      blurSigma: lerpDouble(blurSigma, other.blurSigma, t)!,
    );
  }
}

/// {@template neon_ui_theme}
/// A theme that defines the colors and styles for the Neon UI.
/// {@endtemplate}
class NeonUITheme {
  /// {@macro neon_ui_theme}
  NeonUITheme({
    required this.primaryColor,
    this.decorationConfig = const NeonDecorationConfig(),
    this.iconTheme = const NeonIconTheme(),
    this.buttonTheme = const NeonButtonTheme(),
    this.containerTheme = const NeonContainerTheme(),
  });

  /// The primary color of the Neon UI theme.
  final Color primaryColor;

  /// The neon decoration configuration.
  final NeonDecorationConfig decorationConfig;

  /// The neon icon theme.
  final NeonIconTheme iconTheme;

  /// The neon button theme.
  final NeonButtonTheme buttonTheme;

  /// The neon container theme.
  final NeonContainerTheme containerTheme;

  /// Converts this theme to a Flutter [ThemeData].
  ThemeData toThemeData() {
    final textTheme = GoogleFonts.orbitronTextTheme().apply(
      bodyColor: primaryColor,
      displayColor: primaryColor.withValues(alpha: 0.87),
    );

    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      textTheme: textTheme,
      extensions: <ThemeExtension<dynamic>>[
        decorationConfig,
        iconTheme,
        buttonTheme,
        containerTheme,
      ],
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    );
  }
}
