import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/utils/character_sprite_sheet.dart';
import 'package:flutter/widgets.dart';

class Orc extends SimpleEnemy with PathFinding, UseLifeBar {
  final List<Vector2> path;
  Orc({
    required this.path,
    required super.position,
  }) : super(
          size: Vector2.all(32),
          speed: 30,
          animation: CharacterSpriteSheet(fileName: 'orc.png').getAnimation(),
        ) {
    setupPathFinding(
      linePathEnabled: false,
    );
    setupLifeBar(
      barLifeDrawPosition: BarLifeDrawPorition.bottom,
      showLifeText: false,
      borderRadius: BorderRadius.circular(20),
      size: Vector2(12, 2),
      offset: Vector2(0, -2.5),
    );
    movementOnlyVisible = false;
  }

  @override
  void onMount() {
    moveAlongThePath(path);
    super.onMount();
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2.all(16),
        isSolid: true,
        position: Vector2.all(8),
      ),
    );
    return super.onLoad();
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
