//
//  AOButton.m
//  AOKit
//
//  Created by 朱晓峰 on 2021/5/11.
//

#import "AOButton.h"

@interface AOButton()



@end

@implementation AOButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    _positionType = AOButtonImageRight;
}

- (void)setPositionType:(AOButtonImageTitlePositionType)positionType {
    if (_positionType != positionType) {
        _positionType = positionType;
        
        [self invalidateIntrinsicContentSize];
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    
    CGSize labelSize = [self.titleLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    CGSize imageSize = [self.imageView sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    
    switch (self.positionType) {
        case AOButtonImageLeft:
        case AOButtonImageRight:
        {
            CGFloat height = imageSize.height > labelSize.height ? imageSize.height : labelSize.height;
            size.height = height + self.contentEdgeInsets.top + self.contentEdgeInsets.bottom;
            size.width = labelSize.width + imageSize.width + self.contentEdgeInsets.left + self.contentEdgeInsets.right;
        }
            break;
        case AOButtonImageTop:
        case AOButtonImageBottom:
        {
            size.height = labelSize.height + imageSize.height + self.contentEdgeInsets.top + self.contentEdgeInsets.bottom;
            CGFloat width = imageSize.width > labelSize.width ? imageSize.width : labelSize.width;
            size.width = width + self.contentEdgeInsets.left + self.contentEdgeInsets.right;
        }
            break;
        default:
            break;
    }
    return size;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize labelSize = [self.titleLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    CGSize imageSize = [self.imageView sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    
    CGFloat contentW = labelSize.width + imageSize.width;
    CGFloat contentH = labelSize.height + imageSize.height;
    CGSize buttonSize = self.bounds.size;
    
    switch (self.positionType) {
        case AOButtonImageLeft:
        {
            
            self.imageView.frame = CGRectMake((buttonSize.width - contentW)/2.0, (buttonSize.height - imageSize.height)/2.0, imageSize.width, imageSize.height);
            self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame), (buttonSize.height - labelSize.height)/2.0, labelSize.width, labelSize.height);
            
            
        }
            break;
        case AOButtonImageTop:
        {
            self.imageView.frame = CGRectMake((buttonSize.width - imageSize.width)/2.0, (buttonSize.height - contentH)/2.0, imageSize.width, imageSize.height);
            self.titleLabel.frame = CGRectMake((buttonSize.width - labelSize.width)/2.0, CGRectGetMaxY(self.imageView.frame), labelSize.width, labelSize.height);
            
        }
            break;
        case AOButtonImageBottom:
        {
            self.titleLabel.frame = CGRectMake((buttonSize.width - labelSize.width)/2.0, (buttonSize.height - contentH)/2.0, labelSize.width, labelSize.height);
            self.imageView.frame = CGRectMake((buttonSize.width - imageSize.width)/2.0, CGRectGetMaxY(self.titleLabel.frame), imageSize.width, imageSize.height);
        }
            break;
        case AOButtonImageRight:
        {
            self.titleLabel.frame = CGRectMake((buttonSize.width - contentW)/2.0, (buttonSize.height - labelSize.height)/2.0, labelSize.width, labelSize.height);
            self.imageView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame), (buttonSize.height - imageSize.height)/2.0, imageSize.width, imageSize.height);
        }
            break;
        default:
            break;
    }
}


@end

