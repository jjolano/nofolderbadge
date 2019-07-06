@interface SBIcon : NSObject
@end

@interface SBIconView : UIView
@end

@interface SBFolderIconView : SBIconView
@end

@interface SBIconBadgeView : UIView
@end

%hook SBIconBadgeView
- (void)layoutSubviews {
	%orig;

	UIView *parentView = [self superview];

	if([parentView isKindOfClass:%c(SBFolderIconView)]) {
		self.hidden = YES;
	}
}
%end
