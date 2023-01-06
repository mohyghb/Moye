import 'package:flutter/material.dart';


@Deprecated('This feature will not be supported anymore starting next release')
/// A utils class which aims to make it easier to create [Container] and [AnimatedContainer]
class Containers {
  static Widget build({
    Widget? child,
    List<BoxShadow>? boxShadow,
    Color? color,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BorderRadiusGeometry? borderRadius,
    double? width,
    double? height,
    Matrix4? transform,
    Gradient? gradient,
    DecorationImage? image,
    BoxBorder? border,
    BoxConstraints? constraints,
    BlendMode? backgroundBlendMode,
    Clip clipBehavior = Clip.hardEdge,
    BoxShape shape = BoxShape.rectangle
  }) {
    return Container (
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      transform: transform,
      constraints: constraints,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          borderRadius: shape == BoxShape.circle ? null : borderRadius,
          color: color,
          gradient: gradient,
          image: image,
          border: border,
          backgroundBlendMode: backgroundBlendMode,
          shape: shape
      ),
      child: child,
    );
  }

  static Widget buildAnimated({
    Widget? child,
    List<BoxShadow>? boxShadow,
    Color? color,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BorderRadiusGeometry? borderRadius,
    double? width,
    double? height,
    Matrix4? transform,
    Gradient? gradient,
    DecorationImage? image,
    Duration? duration,
    BoxBorder? border,
    Curve curve = Curves.linear,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return AnimatedContainer (
      duration: duration ?? Duration(milliseconds: 300),
      curve: curve,
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      transform: transform,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          borderRadius: borderRadius,
          color: color,
          gradient: gradient,
          image: image,
          border: border
      ),
      child: child,
    );
  }
}