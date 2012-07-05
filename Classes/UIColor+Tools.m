#import "UIColor+Tools.h"

@implementation UIColor (Tools)

- (UIColor*)colorByDarkeningColor {
	// oldComponents is the array INSIDE the original color
	// changing these changes the original, so we copy it
	CGFloat *oldComponents = (CGFloat *)CGColorGetComponents([self CGColor]);
	CGFloat newComponents[4];
    
	int numComponents = CGColorGetNumberOfComponents([self CGColor]);
    
	switch (numComponents) {
		case 2: {
			//grayscale
			newComponents[0] = oldComponents[0]*0.7;
			newComponents[1] = oldComponents[0]*0.7;
			newComponents[2] = oldComponents[0]*0.7;
			newComponents[3] = oldComponents[1];
			break;
		}
		case 4: {
			//RGBA
			newComponents[0] = oldComponents[0]*0.7;
			newComponents[1] = oldComponents[1]*0.7;
			newComponents[2] = oldComponents[2]*0.7;
			newComponents[3] = oldComponents[3];
			break;
		}
	}
    
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
	return retColor;
}

+ (UIColor*)colorForIndex:(NSInteger)idx {
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
	CGFloat components[4] = {0, 0, 0, 1};
    
	switch (idx) {
		case 0:
			components[0] = 1;
			break;
		case 1:
			components[1] = 0.8;
			break;
		case 2:
			components[2] = 1;
			break;
			break;
		case 3:
			components[0] = 1;
			components[1] = 1;
			break;
		case 4:
			components[1] = 1;
			components[2] = 1;
			break;
		case 5:
			components[0] = 1;
			components[2] = 1;
			break;
		case 6:
			components[0] = 1;
			components[1] = 0.5;
			break;
		case 7:
			components[1] = 1;
			components[2] = 0.5;
			break;
		case 8:
			components[0] = 0.5;
			components[2] = 1;
			break;
		case 9:
			components[0] = 0.5;
			components[1] = 1;
			break;
		case 10:
			components[1] = 0.5;
			components[2] = 1;
			break;
		case 11:
			components[2] = 0.5;
			break;
		case 12:
			components[0] = 1;
			components[1] = 0.33;
			components[2] = 0.33;
			break;
		case 13:
			components[0] = 0.33;
			components[1] = 0.8;
			components[2] = 0.33;
			break;
		case 14:
			components[0] = 0.33;
			components[1] = 0.33;
			components[2] = 1;
			break;
		case 15:
			components[0] = 1;
			components[1] = 1;
			components[2] = 0.33;
			break;
		case 16:
			components[0] = 0.33;
			components[1] = 1;
			components[2] = 1;
			break;
		case 17:
			components[0] = 1;
			components[1] = 0.33;
			components[2] = 1;
			break;
		case 18:
			components[0] = 1;
			components[1] = 0.66;
			components[2] = 0.33;
			break;
		case 19:
			components[0] = 0.33;
			components[1] = 1;
			components[2] = 0.66;
			break;
		case 20:
			components[0] = 0.66;
			components[1] = 0.33;
			components[2] = 1;
			break;
		case 21:
			components[0] = 0.66;
			components[1] = 1;
			components[2] = 0.33;
			break;
		case 22:
			components[0] = 0.33;
			components[1] = 0.66;
			components[2] = 1;
			break;
		case 23:
			components[0] = 0.33;
			components[1] = 0.33;
			components[2] = 0.66;
			break;
	}
    
	CGColorRef newColor = CGColorCreate(colorSpace, components);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
	return retColor;
	// more colors: make each 0 -&gt; 0.33 and each 0.5 a 0.66, Ones stay the same
}

@end