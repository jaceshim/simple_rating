import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

/// Simple Rating
class SimpleRating extends StatelessWidget {
  final RatingIcon icons;
  final int starCount;
  final double rating;
  final RatingChangeCallback onChanged;
  final Color color;
  final Color borderColor;
  final double size;
  final bool useHalfRating;
  final double spacing;

  SimpleRating(
      {this.icons = const RatingIcon(),
      this.starCount = 5,
      this.rating = 0.0,
      this.onChanged,
      this.color,
      this.borderColor,
      this.size,
      this.spacing = 0.0,
      this.useHalfRating = true}) {
    assert(this.rating != null);
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: borderColor ?? Theme.of(context).primaryColor,
        size: size ?? 25.0,
      );
    } else if (rating.toInt() >= index + 1) {
      icon = Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
        size: size ?? 25.0,
      );
    } else {
      icon = Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: size ?? 25.0,
      );
    }

    return GestureDetector(
      onTap: () {
        if (this.onChanged != null) onChanged(index + 1.0);
      },
      onHorizontalDragUpdate: (dragDetails) {
        RenderBox box = context.findRenderObject();
        var _position = box.globalToLocal(dragDetails.globalPosition);
        var i = _position.dx / size;
        var newRating = i.round().toDouble();
        if (useHalfRating) {
          newRating = _customRound(i);
        }
        if (newRating > starCount) {
          newRating = starCount.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
        if (this.onChanged != null) onChanged(newRating);
      },
      child: icon,
    );
  }

  double _customRound(double val) {
    if (val <= 0) {
      return 0;
    }

    final int intVal = val.toInt();
    double tempVal = val - intVal;
    if (tempVal < 0.5) {
      return intVal.toDouble() + 0.5;
    } else {
      return (intVal + 1).toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: spacing,
          children: List.generate(starCount, (index) => buildStar(context, index))),
    );
  }
}

/// Rating Icon
class RatingIcon {
  final IconData emptyIcon;
  final IconData halfIcon;
  final IconData fullIcon;

  const RatingIcon({this.emptyIcon, this.halfIcon, this.fullIcon});
}
