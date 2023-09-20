//
//  MarkerWorldTransform.h
//  NavCogMiraikan
//
//  Created by yoshizawr204 on 2022/10/04.
//

#ifndef MarkerWorldTransform_h
#define MarkerWorldTransform_h

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MarkerWorldTransform : NSObject

@property(nonatomic) int arucoId;
@property(nonatomic) SCNMatrix4 transform;
@property(nonatomic) NSArray *points;
@property(nonatomic) CGPoint intersection;

@property(nonatomic) CGFloat distance;
@property(nonatomic) CGFloat horizontalDistance;

@property(nonatomic) CGFloat x;
@property(nonatomic) CGFloat y;
@property(nonatomic) CGFloat z;
@property(nonatomic) CGFloat roll;
@property(nonatomic) CGFloat pitch;
@property(nonatomic) CGFloat yaw;

@end

NS_ASSUME_NONNULL_END

#endif /* MarkerWorldTransform_h */
