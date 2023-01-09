import 'package:flutter/material.dart';

const double s4 = 4;
const double s8 = 8;
const double s12 = 12;
const double s16 = 16;
const double s24 = 24;
const double s32 = 32;
const double s40 = 40;
const double s48 = 48;

/// horizontal padding constants
const EdgeInsets s4HorizontalPadding = const EdgeInsets.symmetric(horizontal: s4);
const EdgeInsets s8HorizontalPadding = const EdgeInsets.symmetric(horizontal: s8);
const EdgeInsets s12HorizontalPadding = const EdgeInsets.symmetric(horizontal: s12);
const EdgeInsets s16HorizontalPadding = const EdgeInsets.symmetric(horizontal: s16);
const EdgeInsets s24HorizontalPadding = const EdgeInsets.symmetric(horizontal: s24);
const EdgeInsets s32HorizontalPadding = const EdgeInsets.symmetric(horizontal: s32);

/// vertical padding constants
const EdgeInsets s4VerticalPadding = const EdgeInsets.symmetric(vertical: s4);
const EdgeInsets s8VerticalPadding = const EdgeInsets.symmetric(vertical: s8);
const EdgeInsets s12VerticalPadding = const EdgeInsets.symmetric(vertical: s12);
const EdgeInsets s16VerticalPadding = const EdgeInsets.symmetric(vertical: s16);
const EdgeInsets s24VerticalPadding = const EdgeInsets.symmetric(vertical: s24);
const EdgeInsets s32VerticalPadding = const EdgeInsets.symmetric(vertical: s32);

/// symmetric padding constants
const EdgeInsets s4Vertical8Horizontal = const EdgeInsets.symmetric(vertical: s4, horizontal: s8);
const EdgeInsets s8Vertical16Horizontal = const EdgeInsets.symmetric(vertical: s8, horizontal: s16);

/// all insets padding constants
const EdgeInsets s4Padding = const EdgeInsets.all(s4);
const EdgeInsets s8Padding = const EdgeInsets.all(s8);
const EdgeInsets s12Padding = const EdgeInsets.all(s12);
const EdgeInsets s16Padding = const EdgeInsets.all(s16);
const EdgeInsets s24Padding = const EdgeInsets.all(s24);
const EdgeInsets s32Padding = const EdgeInsets.all(s32);


/// height boxes
const SizedBox s4HeightBox = const SizedBox(height: s4);
const SizedBox s8HeightBox = const SizedBox(height: s8);
const SizedBox s12HeightBox = const SizedBox(height: s12);
const SizedBox s16HeightBox = const SizedBox(height: s16);
const SizedBox s24HeightBox = const SizedBox(height: s24);
const SizedBox s32HeightBox = const SizedBox(height: s32);

/// width boxes
const SizedBox s4WidthBox = const SizedBox(width: s4);
const SizedBox s8WidthBox = const SizedBox(width: s8);
const SizedBox s12WidthBox = const SizedBox(width: s12);
const SizedBox s16WidthBox = const SizedBox(width: s16);
const SizedBox s24WidthBox = const SizedBox(width: s24);
const SizedBox s32WidthBox = const SizedBox(width: s32);


// sliver versions
/// height boxes
const SliverToBoxAdapter s4HeightBoxSliver = const SliverToBoxAdapter(child: s4HeightBox);
const SliverToBoxAdapter s8HeightBoxSliver = const SliverToBoxAdapter(child: s8HeightBox);
const SliverToBoxAdapter s12HeightBoxSliver = const SliverToBoxAdapter(child: s8HeightBox);
const SliverToBoxAdapter s16HeightBoxSliver = const SliverToBoxAdapter(child: s16HeightBox);
const SliverToBoxAdapter s24HeightBoxSliver = const SliverToBoxAdapter(child: s24HeightBox);
const SliverToBoxAdapter s32HeightBoxSliver = const SliverToBoxAdapter(child: s32HeightBox);

/// width boxes
const SliverToBoxAdapter s4WidthBoxSliver = const SliverToBoxAdapter(child: s4WidthBox);
const SliverToBoxAdapter s8WidthBoxSliver = const SliverToBoxAdapter(child: s8WidthBox);
const SliverToBoxAdapter s12WidthBoxSliver = const SliverToBoxAdapter(child: s8WidthBox);
const SliverToBoxAdapter s16WidthBoxSliver = const SliverToBoxAdapter(child: s16WidthBox);
const SliverToBoxAdapter s24WidthBoxSliver = const SliverToBoxAdapter(child: s24WidthBox);
const SliverToBoxAdapter s32WidthBoxSliver = const SliverToBoxAdapter(child: s32WidthBox);


/// constant widgets
const SizedBox empty = const SizedBox();