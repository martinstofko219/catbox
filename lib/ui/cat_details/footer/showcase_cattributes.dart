import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:catbox/models/cat.dart';
import 'package:catbox/models/cattribute.dart';

class CattributesShowcase extends StatelessWidget {
  final Cat cat;
  final Map<String, Cattribute> _cattributeLookup = {
    "children": Cattribute('Kid Friendly', FontAwesomeIcons.child),
    "desexed": Cattribute('Desexed', FontAwesomeIcons.neuter),
    "vaccinated": Cattribute('Vaccinated', FontAwesomeIcons.eyeDropper),
    "microchipped": Cattribute('Micro Chipped', FontAwesomeIcons.microchip),
  };

  CattributesShowcase(this.cat);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<Widget> cattributeBadges = _getCattributesBadges(cat);

    if (cattributeBadges.isEmpty) {
      return _buildEmptyState(textTheme);
    }

    SliverGridDelegate delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );
    return GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: cattributeBadges,
    );
  }

  Widget _buildCircleBadge(
      IconData icon, Color bgColor, Color iconColor, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: bgColor,
            radius: 36.0,
            child: Icon(
              icon,
              color: iconColor,
              size: 36.0,
            ),
          ),
          Positioned(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(TextTheme textTheme) {
    return Center(
      child: Text(
        'What?! No cat images?',
        style: textTheme.subhead.copyWith(color: Colors.white),
      ),
    );
  }

  List<Widget> _getCattributesBadges(Cat cat) {
    final List<Widget> badges = [];
    cat.cattributes.forEach((String ct) {
      badges.add(_buildCircleBadge(
        _cattributeLookup[ct].icon,
        Colors.white12,
        Colors.white,
        _cattributeLookup[ct].name,
      ));
    });

    return badges;
  }
}
