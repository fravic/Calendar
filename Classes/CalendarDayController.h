#import <UIKit/UIKit.h>
#import "CalendarDay.h"
#import "CalendarEvent.h"
#import "Event.h"

#define EDGE_DRAG_PIXELS		30.0f

typedef enum {
    kDragStartTime,
    kDragEndTime,
    kDragBoth
} DragType;

@protocol CalendarDayDelegate
- (void)showCategoryChooserWithDelegate:(id<CategoryChooserDelegate>)delegate;
- (Event*)createEventWithStartTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime;

- (void)updateEvent:(NSString*)eventId title:(NSString*)title;
- (void)updateEvent:(NSString*)eventId startTime:(NSTimeInterval)startTime;
- (void)updateEvent:(NSString*)eventId endTime:(NSTimeInterval)endTime;
- (void)updateEvent:(NSString*)eventId category:(Category*)category;
@end

@interface CalendarDayController : UIViewController <UIScrollViewDelegate, CalendarEventDelegate, CategoryChooserDelegate> {
	id<CalendarDayDelegate> _delegate;
	CalendarDay *_calendarDay;
	CalendarEvent *_activeEventBlock;
	NSMutableSet *_eventBlocks;
    
    UIPanGestureRecognizer *_eventBlockPan;
	
	NSTimeInterval _startTime;
	NSTimeInterval _topTime;
	
	DragType _dragType;
    NSTimeInterval _prevDragTime;
}

@property (readonly) NSTimeInterval startTime;

- (id)initWithStartTime:(NSTimeInterval)startTime andDelegate:(id <CalendarDayDelegate>)delegate;
- (void)setEvents:(NSArray*)events;

- (CalendarEvent*)createEventBlockWithStartTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime;
- (CalendarEvent*)createEventBlockWithExistingEvent:(Event*)event;
- (CalendarEvent*)createNewEventWithStartTime:(NSTimeInterval)time;

- (void)createGestureRecognizers;
- (void)createCalendarDay;

- (void)setActiveEventBlock:(CalendarEvent*)event;
- (void)unsetActiveEventBlock;

- (NSTimeInterval)boundaryBeforeTime:(NSTimeInterval)time;
- (NSTimeInterval)boundaryAfterTime:(NSTimeInterval)time;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end

