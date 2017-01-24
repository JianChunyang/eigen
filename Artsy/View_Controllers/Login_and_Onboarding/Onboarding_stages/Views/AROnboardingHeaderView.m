#import "AROnboardingHeaderView.h"
#import "UIColor+ArtsyColors.h"

#import <Artsy_UIFonts/UIFont+ArtsyFonts.h>
#import <Artsy_UILabels/Artsy+UILabels.h>

#import <FLKAutoLayout/UIView+FLKAutoLayout.h>


@interface AROnboardingHeaderView ()


@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) ARSerifLineHeightLabel *helpTextLabel;
@property (nonatomic, strong) NSLayoutConstraint *searchHeightConstraint;

@end


@implementation AROnboardingHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _helpTextLabel = [[ARSerifLineHeightLabel alloc] initWithLineSpacing:3];
        _searchField = [[AROnboardingSearchField alloc] init];
    }

    return self;
}

- (void)setupHeaderViewWithTitle:(NSString *)title withLargeLayout:(BOOL)useLargeLayout
{
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont serifFontWithSize:useLargeLayout ? 40.0 : 30.0];
    self.titleLabel.textAlignment = useLargeLayout ? NSTextAlignmentCenter : NSTextAlignmentLeft;
    self.titleLabel.text = title;
    self.titleLabel.numberOfLines = 0;
    [self addSubview:self.titleLabel];

    if (useLargeLayout) {
        [self.titleLabel constrainWidth:@"800"];
        [self.titleLabel alignCenterXWithView:self predicate:@"0"];
    } else {
        [self.titleLabel constrainWidthToView:self predicate:@"*.8"];
        [self.titleLabel alignLeadingEdgeWithView:self predicate:@"20"];
    }
    [self.titleLabel alignTopEdgeWithView:self predicate:@"30"];
    [self.titleLabel constrainHeight:@"60"];


}

- (void)addHelpText:(NSString *)helpText withLargeLayout:(BOOL)useLargeLayout
{
    self.helpTextLabel.textColor = [UIColor artsyGraySemibold];
    self.helpTextLabel.font = [UIFont serifFontWithSize:useLargeLayout ? 28.0 : 20.0];
    self.helpTextLabel.textAlignment = useLargeLayout ? NSTextAlignmentCenter : NSTextAlignmentLeft;
    self.helpTextLabel.text = helpText;
    self.helpTextLabel.numberOfLines = 0;
    [self addSubview:self.helpTextLabel];
    
    if (useLargeLayout) {
        [self.helpTextLabel constrainWidth:@"800"];
        [self.helpTextLabel alignCenterXWithView:self predicate:@"0"];
    } else {
        [self.helpTextLabel constrainWidthToView:self predicate:@"*.8"];
        [self.helpTextLabel alignLeadingEdgeWithView:self predicate:@"20"];
    }
    [self.helpTextLabel constrainTopSpaceToView:self.titleLabel predicate:@"0"];
    [self.helpTextLabel constrainHeight:@"50"];

}

- (void)showSearchBar
{
    [self addSubview:self.searchField];
    
    self.searchHeightConstraint = [self.searchField constrainHeight:@"40"];
    [self.searchField constrainTopSpaceToView:self.titleLabel predicate:@"20"];
    [self.searchField alignLeadingEdgeWithView:self predicate:@"20"];
    [self.searchField alignTrailingEdgeWithView:self predicate:@"-20"];
    self.searchField.tintColor = [UIColor blackColor];
}

@end
