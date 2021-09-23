import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:stocks/data/stocks.dart';
import 'package:stocks/screens/details.dart';
import 'package:stocks/styles.dart';

class FrostyBackground extends StatelessWidget {
  const FrostyBackground({
    this.color,
    this.child,
    this.intensity = 10,
  });

  final Color? color;
  final double intensity;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: intensity, sigmaY: intensity),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}

/// A Card-like Widget that responds to tap events by animating changes to its
/// elevation and invoking an optional [onPressed] callback.
class PressableCard extends StatefulWidget {
  const PressableCard({
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.upElevation = 3,
    this.downElevation = 0,
    this.shadowColor = CupertinoColors.black,
    this.duration = const Duration(milliseconds: 100),
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;

  final Widget child;

  final BorderRadius borderRadius;

  final double upElevation;

  final double downElevation;

  final Color shadowColor;

  final Duration duration;

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {
  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => cardIsDown = !cardIsDown);
        widget.onPressed();
      },
      onTapDown: (details) => setState(() => cardIsDown = true),
      onTapCancel: () => setState(() => cardIsDown = false),
      child: AnimatedPhysicalModel(
        elevation: cardIsDown ? widget.downElevation : widget.upElevation,
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        shadowColor: widget.shadowColor,
        duration: widget.duration,
        color: CupertinoColors.lightBackgroundGray,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: widget.child,
        ),
      ),
    );
  }
}

class StockCard extends StatelessWidget {
  const StockCard(this.stock, this.isPreferredCategory);

  /// Stocks to be displayed by the card.
  final Stock stock;

  /// Whether [stock] falls into one of user's preferred [StockCategory]s
  final bool isPreferredCategory;

  Widget _buildDetails(BuildContext context) {
    final themeData = CupertinoTheme.of(context);
    return FrostyBackground(
      color: const Color(0x90ffffff),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: const Icon(CupertinoIcons.home),
              padding: const EdgeInsets.only(right: 10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  stock.displayName,
                  style: Styles.cardTitleText(themeData),
                ),
                Text(
                  stock.symbol,
                  style: Styles.cardDescriptionText(themeData),
                ),
              ],
            ),
            const Spacer(),
            const Text('10.00'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      onPressed: () => DetailsScreen.show(Navigator.of(context), stock.id),
      child: Stack(
        children: [
          Semantics(
            label: 'A card background featuring ${stock.displayName}',
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  image: AssetImage((stock.image != '')
                      ? stock.image
                      : 'assets/images/default.jpg'),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildDetails(context),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: (stock.isFavorite)
                  ? const Icon(
                      CupertinoIcons.heart_solid,
                      color: CupertinoColors.systemRed,
                    )
                  : const Icon(
                      CupertinoIcons.heart,
                      color: CupertinoColors.systemRed,
                    )),
        ],
      ),
    );
  }
}
