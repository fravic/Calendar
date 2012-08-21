#import "LayerAnimationFactory.h"

@implementation LayerAnimationFactory

+ (void)animate:(CALayer*)layer toFrame:(CGRect)frame {
    [self animateBoundsOfLayer:layer to:frame];
    [self animatePositionOfLayer:layer to:frame.origin];
}

+ (void)animateBoundsOfLayer:(CALayer*)layer to:(CGRect)bounds {
    CABasicAnimation *resize = [CABasicAnimation animationWithKeyPath:@"bounds"];
    resize.fromValue = [NSValue valueWithCGRect:layer.bounds];
    resize.toValue = [NSNumber valueWithCGRect:bounds];
    resize.duration = UI_ANIM_DURATION_RAISE;
    resize.removedOnCompletion = NO;
    resize.fillMode = kCAFillModeForwards;
    resize.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    layer.bounds = bounds;
    resize.delegate = layer;
    [layer addAnimation:resize forKey:@"bounds"];
}

+ (void)animatePositionOfLayer:(CALayer*)layer to:(CGPoint)pos {
    CABasicAnimation *moveBox = [CABasicAnimation animationWithKeyPath:@"position"];
    moveBox.fromValue = [NSValue valueWithCGPoint:layer.position];
    moveBox.toValue = [NSValue valueWithCGPoint:pos];
    moveBox.duration = UI_ANIM_DURATION_RAISE;
    moveBox.fillMode = kCAFillModeForwards;
    moveBox.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    layer.position = pos;
    moveBox.delegate = layer;
    [layer addAnimation:moveBox forKey:@"activeInactive"];
}

@end
