// lib/Shared/widgets/neumorphic_container.dart
import 'package:flutter/material.dart';

enum NeumorphicShape { flat, concave, convex }

class NeumorphicContainer extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double depth;
  final NeumorphicShape shape;
  final Color backgroundColor;
  final double blurRadius;
  final double spreadRadius;

  const NeumorphicContainer({
    super.key,
    this.child,
    this.borderRadius = 12.0,
    this.padding,
    this.margin,
    this.depth = 20.0,
    this.shape = NeumorphicShape.flat,
    this.backgroundColor = const Color(0xFFE0E0E0), // Light gray background from image
    this.blurRadius = 18.0,
    this.spreadRadius = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final lightShadowColor = Colors.white.withOpacity(0.5);
    final darkShadowColor = Colors.black.withOpacity(0.1);

    List<BoxShadow> shadows;

    switch (shape) {
      case NeumorphicShape.concave:
        shadows = [
          BoxShadow(
            color: darkShadowColor,
            offset: Offset(depth / 2, depth / 2),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
          BoxShadow(
            color: lightShadowColor,
            offset: Offset(-depth / 2, -depth / 2),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ];
        break;
      case NeumorphicShape.convex: // Raised effect for buttons
        shadows = [
          BoxShadow(
            color: darkShadowColor,
            offset: Offset(depth, depth),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
          BoxShadow(
            color: lightShadowColor,
            offset: Offset(-depth, -depth),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ];
        break;
      case NeumorphicShape.flat:
      default:
        shadows = [
          BoxShadow(
            color: darkShadowColor,
            offset: Offset(depth / 4, depth / 4),
            blurRadius: blurRadius / 2,
            spreadRadius: spreadRadius / 2,
          ),
          BoxShadow(
            color: lightShadowColor,
            offset: Offset(-depth / 4, -depth / 4),
            blurRadius: blurRadius / 2,
            spreadRadius: spreadRadius / 2,
          ),
        ];
        break;
    }

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadows,
      ),
      child: child,
    );
  }
}