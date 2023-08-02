import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:melt/shared/theme/app_theme.dart';

class MeltAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MeltAppBar({
    super.key,
    this.isHorizontal = false,
  });

  final bool isHorizontal;

  factory MeltAppBar.horizontal({
    Key? key,
  }) =>
      MeltAppBar(
        key: key,
        isHorizontal: true,
      );

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    final color = Theme.of(context).colorScheme.primary;
    return Container(
      decoration: BoxDecoration(
        gradient: isHorizontal
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [-0.5, 1],
                colors: [
                  Theme.of(context).colorScheme.brandDarkBlue,
                  Theme.of(context).colorScheme.primary
                ],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 1.5],
                colors: [
                  Theme.of(context).colorScheme.brandDarkBlue,
                  Theme.of(context).colorScheme.primary
                ],
              ),
      ),
      child: SafeArea(
        left: isHorizontal ? false : true,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: kToolbarHeight - 2,
              child: _CustomPaint(
                color1: color,
                color2: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              scrolledUnderElevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [-0.5, 1],
                    colors: [
                      Theme.of(context).colorScheme.brandDarkBlue,
                      Theme.of(context).colorScheme.primary
                    ],
                  ),
                ),
                height: isHorizontal
                    ? kTextTabBarHeight * 1.2
                    : kTextTabBarHeight * 2.4,
              ),
              leadingWidth: canPop ? null : 100,
              leading: canPop
                  ? GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SvgPicture.asset(
                        'assets/svg/melt-logo.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomPaint extends StatelessWidget {
  const _CustomPaint({
    required this.color1,
    required this.color2,
  });

  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(500, kToolbarHeight),
      painter: _MeltingPainter(
        color1: color1,
        color2: color2,
      ),
    );
  }
}

class _MeltingPainter extends CustomPainter {
  const _MeltingPainter({
    required this.color1,
    required this.color2,
  });

  final Color color1;
  final Color color2;
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.03383403);
    path.lineTo(size.width * 0.0003492729, size.height * 0.03383403);
    path.cubicTo(
        size.width * -0.001767532,
        size.height * 0.2317817,
        size.width * 0.005852967,
        size.height * 0.1466389,
        size.width * 0.01589721,
        size.height * 0.2813801);
    path.cubicTo(
        size.width * 0.01798226,
        size.height * 0.3577484,
        size.width * 0.02986812,
        size.height * 0.3916568,
        size.width * 0.03771089,
        size.height * 0.3302350);
    path.cubicTo(
        size.width * 0.04121420,
        size.height * 0.3045062,
        size.width * 0.04303465,
        size.height * 0.2470256,
        size.width * 0.04845367,
        size.height * 0.2423409);
    path.cubicTo(
        size.width * 0.06027603,
        size.height * 0.2488846,
        size.width * 0.06352533,
        size.height * 0.3974569,
        size.width * 0.06227641,
        size.height * 0.4586556);
    path.cubicTo(
        size.width * 0.06114392,
        size.height * 0.5302647,
        size.width * 0.05160771,
        size.height * 0.6624777,
        size.width * 0.06250926,
        size.height * 0.7202558);
    path.cubicTo(
        size.width * 0.06638301,
        size.height * 0.7352023,
        size.width * 0.07324146,
        size.height * 0.7345330,
        size.width * 0.07613090,
        size.height * 0.7090274);
    path.cubicTo(
        size.width * 0.08398425,
        size.height * 0.6069304,
        size.width * 0.06668995,
        size.height * 0.4325550,
        size.width * 0.08378315,
        size.height * 0.3594587);
    path.cubicTo(
        size.width * 0.09654749,
        size.height * 0.3209399,
        size.width * 0.1123600,
        size.height * 0.4082391,
        size.width * 0.1139370,
        size.height * 0.5078822);
    path.cubicTo(
        size.width * 0.1163925,
        size.height * 0.6638905,
        size.width * 0.1124024,
        size.height * 0.7238251,
        size.width * 0.1089731,
        size.height * 0.8300863);
    path.cubicTo(
        size.width * 0.1023687,
        size.height * 1.034652,
        size.width * 0.1399949,
        size.height * 1.070791,
        size.width * 0.1352533,
        size.height * 0.8484533);
    path.cubicTo(
        size.width * 0.1333905,
        size.height * 0.7612284,
        size.width * 0.1305328,
        size.height * 0.7128941,
        size.width * 0.1297602,
        size.height * 0.6513980);
    path.cubicTo(
        size.width * 0.1293686,
        size.height * 0.6204640,
        size.width * 0.1295167,
        size.height * 0.5648424,
        size.width * 0.1296543,
        size.height * 0.5587448);
    path.cubicTo(
        size.width * 0.1303635,
        size.height * 0.4956127,
        size.width * 0.1331894,
        size.height * 0.4095776,
        size.width * 0.1427150,
        size.height * 0.3883105);
    path.cubicTo(
        size.width * 0.1532038,
        size.height * 0.3649613,
        size.width * 0.1538706,
        size.height * 0.4260113,
        size.width * 0.1559662,
        size.height * 0.4758328);
    path.cubicTo(
        size.width * 0.1600199,
        size.height * 0.5348751,
        size.width * 0.1698419,
        size.height * 0.5122695,
        size.width * 0.1713554,
        size.height * 0.4542683);
    path.cubicTo(
        size.width * 0.1731229,
        size.height * 0.4086109,
        size.width * 0.1725620,
        size.height * 0.3609459,
        size.width * 0.1735992,
        size.height * 0.3146193);
    path.cubicTo(
        size.width * 0.1752186,
        size.height * 0.2398126,
        size.width * 0.1892953,
        size.height * 0.2346074,
        size.width * 0.1956140,
        size.height * 0.2819007);
    path.cubicTo(
        size.width * 0.2034779,
        size.height * 0.3439917,
        size.width * 0.1984082,
        size.height * 0.4490631,
        size.width * 0.1987786,
        size.height * 0.5238697);
    path.cubicTo(
        size.width * 0.1957833,
        size.height * 0.6220999,
        size.width * 0.2103893,
        size.height * 0.6893218,
        size.width * 0.2203806,
        size.height * 0.6122100);
    path.cubicTo(
        size.width * 0.2270803,
        size.height * 0.5271416,
        size.width * 0.2189412,
        size.height * 0.4107674,
        size.width * 0.2196503,
        size.height * 0.3148424);
    path.cubicTo(
        size.width * 0.2178510,
        size.height * 0.1711779,
        size.width * 0.2276518,
        size.height * 0.1194230,
        size.width * 0.2325734,
        size.height * 0.09867638);
    path.cubicTo(
        size.width * 0.2374950,
        size.height * 0.07792980,
        size.width * 0.2437395,
        size.height * 0.03866746,
        size.width * 0.2696916,
        size.height * 0.03375967);
    path.lineTo(size.width, size.height * 0.03375967);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    Paint paintFill = Paint()
      ..shader = ui.Gradient.linear(
        Offset.zero,
        const Offset(0, kTextTabBarHeight * 2),
        [color1, color2],
      );
    paintFill.color = color1.withOpacity(1.0);
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
