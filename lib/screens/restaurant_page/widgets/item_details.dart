import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yummy/models/restaurant.dart';
import 'cart_control.dart';

class ItemDetails extends ConsumerWidget {
  const ItemDetails({super.key, required this.item});

  final Item item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    final colorTheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name, style: textTheme.headlineMedium),
              const SizedBox(
                height: 16.0,
              ),
              MostLikedBadge(colorTheme: colorTheme),
              const SizedBox(height: 16.0),
              Text(item.description),
              const SizedBox(height: 16.0),
              ItemImage(imageUrl: item.imageUrl),
              const SizedBox(height: 16.0),
              CartControl(item),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MostLikedBadge extends StatelessWidget {
  const MostLikedBadge({
    super.key,
    required this.colorTheme,
  });

  final ColorScheme colorTheme;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.all(4.0),
          color: colorTheme.onPrimary,
          child: const Text('#1 Most Liked')),
    );
  }
}
