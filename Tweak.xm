@interface SBIcon : NSObject
- (BOOL)isFolderIcon;
@end

@interface SBIconView : UIView
@property (retain, nonatomic) SBIcon *icon;
@end

@interface SBIconBadgeView : UIView
@end

%hook SBIconBadgeView
- (void)layoutSubviews {
	%orig;

	UIView *parentView = [self superview];
	
	if([parentView isKindOfClass:%c(SBIconView)]) {
		SBIconView *iconView = (SBIconView *)parentView;
		
		if([iconView.icon isFolderIcon]) {
			self.hidden = YES;
		}
	}
}
%end
