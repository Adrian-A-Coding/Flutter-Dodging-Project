import 'package:flame/components.dart';
import 'obstacle_block.dart';

class Block {
  final Vector2 gridPosition;
  final Type blockType;
  Block(this.gridPosition, this.blockType);
}

final segments = [
  segment0,
  segment1,
  segment2,
];
//4x10 segments
final segment0 = [
  Block(Vector2(0, 1), ObstacleBlock),
  Block(Vector2(1, 1), ObstacleBlock),
  Block(Vector2(2, 3), ObstacleBlock),
  Block(Vector2(3, 3), ObstacleBlock),
];

final segment1 = [
  Block(Vector2(0, 0), ObstacleBlock),
  Block(Vector2(2, 0), ObstacleBlock),
  Block(Vector2(1, 2), ObstacleBlock),
  Block(Vector2(3, 2), ObstacleBlock),
];

final segment2 = [
  Block(Vector2(2, 1), ObstacleBlock),
  Block(Vector2(3, 1), ObstacleBlock),
  Block(Vector2(0, 2), ObstacleBlock),
  Block(Vector2(0, 3), ObstacleBlock),
];
