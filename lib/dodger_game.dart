import 'package:final_project/components/star_power.dart';
import 'package:flame/input.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'components/player_piece.dart';
import 'components/segment_manager.dart';
import 'components/obstacle_block.dart';

class DodgerGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  late Player player;

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'jackSprite.png',
      'fireSprite.png',
    ]);

    initializeGame();
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 17, 146, 205);
  }

  void loadSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case ObstacleBlock:
          add(ObstacleBlock(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
        case FireObstacle:
          return;
      }
    }
  }

  void initializeGame() {
    final segmensToBeLoaded = (size.x / 640).ceil();
    segmensToBeLoaded.clamp(0, segments.length);

    for (var i = 0; i <= segmensToBeLoaded; i++) {
      loadSegments(i, (640 * i).toDouble());
    }

    player = Player(
      position: Vector2(128, canvasSize.y - 70),
    );
    add(player);
  }
}
