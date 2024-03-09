import 'package:bonfire/bonfire.dart';

class CharacterSpriteSheet {
  final String path;
  static const _size = 32.0;

  CharacterSpriteSheet({
    required String fileName,
  }) : path = 'character/$fileName';

  SimpleDirectionAnimation getAnimation() {
    return SimpleDirectionAnimation(
      idleRight: _getIdleRight,
      idleDown: _getIdleDown,
      runRight: _getRunRight,
      runUp: _getRunUp,
      runDown: _getRunDown,
    );
  }

  Future<SpriteAnimation> get _getIdleRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.2,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(0, 2 * _size)),
      );
  Future<SpriteAnimation> get _getIdleDown => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.2,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(0, 0)),
      );
  Future<SpriteAnimation> get _getRunRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.2,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(_size, 2 * _size)),
      );
  Future<SpriteAnimation> get _getRunUp => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.2,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(_size, 4 * _size)),
      );
  Future<SpriteAnimation> get _getRunDown => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.2,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(_size, 0)),
      );
}
