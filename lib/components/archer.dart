import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/game.dart';
import 'package:bonfire_defense/utils/character_sprite_sheet.dart';

class Archer extends SimpleAlly with DragGesture {
  Archer({required super.position})
      : super(
          size: Vector2.all(32),
          animation:
              CharacterSpriteSheet(fileName: 'archer.png').getAnimation(),
          initDirection: Direction.down,
        );

  @override
  void update(double dt) {
    seeComponentType<Enemy>(
      observed: ((enemies) {
        final enemy = enemies.first;
        if (checkInterval('attack', 1000, dt)) {
          enemy.receiveDamage(
            AttackFromEnum.PLAYER_OR_ALLY,
            30,
            null,
          );
        }
      }),
      radiusVision: radiusVision,
    );

    super.update(dt);
  }

  double get radiusVision => Game.tileSize * 3;
}
