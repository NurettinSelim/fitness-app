import 'package:fitness_app/core/providers/exercise_add_field_providers.dart';
import 'package:fitness_app/models/exercise_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _diameter = 100.0;

class ExerciseTypeSlider extends ConsumerWidget {
  const ExerciseTypeSlider({super.key});
  final exerciseTypes = ExerciseType.values;
  static const Gradient _maskingGradient = LinearGradient(
    colors: [
      Colors.transparent,
      Colors.black,
      Colors.black,
      Colors.transparent,
    ],
    stops: [0, 0.03, 0.97, 1],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedExerciseType = ref.watch(exerciseTypeProvider);
    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination.
      blendMode: BlendMode.dstIn,
      child: SizedBox(
        height: _diameter,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => SliderItem(
            exerciseType: exerciseTypes[index],
            isSelected: exerciseTypes[index] == selectedExerciseType,
          ),
          separatorBuilder: (context, index) => const FractionallySizedBox(
            heightFactor: 0.9,
            child: VerticalDivider(),
          ),
          itemCount: exerciseTypes.length,
        ),
      ),
    );
  }
}

class SliderItem extends ConsumerWidget {
  const SliderItem({
    super.key,
    required this.exerciseType,
    this.isSelected = false,
  });
  final ExerciseType exerciseType;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Center(
        child: Container(
          height: _diameter,
          width: _diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.primary,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(_diameter / 2),
              onTap: () {
                ref.watch(exerciseTypeProvider.notifier).state = exerciseType;
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/fitness_icons/${exerciseType.name}.png",
                      height: _diameter / 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
