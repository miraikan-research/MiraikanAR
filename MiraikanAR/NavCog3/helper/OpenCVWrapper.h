//
//  OpenCVWrapper.h
//  NavCogMiraikan
//
//  Created by yoshizawr204 on 2022/10/03.
//

#ifndef OpenCVWrapper_h
#define OpenCVWrapper_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreVideo/CoreVideo.h>
#import <SceneKit/SceneKit.h>

@interface OpenCVWrapper : NSObject

+(NSMutableArray *)estimatePose:(CVPixelBufferRef)pixelBuffer withIntrinsics:(matrix_float3x3)intrinsics andMarkerSize:(float)markerSize;

+(UIImage *)createARMarker:(int)markerId;

@end

#endif /* OpenCVWrapper_h */
