//
//  AOButton.h
//  AOKit
//
//  Created by 朱晓峰 on 2021/5/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 图片、标题  位置
 JMButtonImageTop：图片在上，标题在下
 JMButtonImageBottom：图片在下，标题在上
 JMButtonImageLeft：图片在左，标题在右
 JMButtonImageRight：图片在右，标题在左
 */
typedef enum : NSUInteger {
    AOButtonImageTop = 0,
    AOButtonImageBottom,
    AOButtonImageLeft,
    AOButtonImageRight,
} AOButtonImageTitlePositionType;

@interface AOButton : UIButton
/**
 图片、标题位置
 */
@property (nonatomic, assign) AOButtonImageTitlePositionType positionType;


@end

NS_ASSUME_NONNULL_END
