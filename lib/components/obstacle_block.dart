import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

import '../dodger_game.dart';
import 'segment_manager.dart';

class ObstacleBlock extends SpriteComponent with HasGameRef {
  final UniqueKey _blockKey = UniqueKey();
  final Vector2 gridPosition;
  double xOffset;

  ObstacleBlock({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.bottomLeft);

  @override
  Future<void> onLoad() async {
    final blockImage = game.images.fromCache('block.png');
    sprite = Sprite(blockImage);
    position = Vector2((gridPosition.x * size.x) + xOffset,
        game.size.y - (gridPosition.y * size.y));
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }

  @override
  void update(double dt) {
    if (position.y < -game.size.y) removeFromParent();
    super.update(dt);
  }
}
