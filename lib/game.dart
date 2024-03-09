import 'package:bonfire/bonfire.dart';
import 'package:bonfire_defense/components/archer.dart';
import 'package:bonfire_defense/components/orc.dart';
import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  static const tileSize = 16.0;
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        TiledReader.asset('map/map2.tmj'),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        initialMapZoomFit: InitialMapZoomFitEnum.fitWidth,
      ),
      showCollisionArea: true,
      components: [
        Orc(
          position: Vector2(
            -1 * tileSize,
            7 * tileSize,
          ),
          path: gamePath,
        ),
        Archer(
            position: Vector2(
          8 * tileSize - tileSize / 2,
          3 * tileSize - tileSize / 2,
        ))
      ],
    );
  }

  List<Vector2> get gamePath => [
        Vector2(
          7 * Game.tileSize + Game.tileSize / 2,
          7 * Game.tileSize + Game.tileSize / 2,
        ),
        Vector2(
          7 * Game.tileSize + Game.tileSize / 2,
          2 * Game.tileSize + Game.tileSize / 2,
        ),
        Vector2(
          13 * Game.tileSize + Game.tileSize / 2,
          2 * Game.tileSize + Game.tileSize / 2,
        ),
        Vector2(
          13 * Game.tileSize + Game.tileSize / 2,
          8 * Game.tileSize + Game.tileSize / 2,
        ),
        Vector2(
          20 * Game.tileSize + Game.tileSize / 2,
          8 * Game.tileSize + Game.tileSize / 2,
        ),
      ];
}
