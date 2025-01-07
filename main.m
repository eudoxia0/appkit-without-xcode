#import <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong) NSWindow *window;
@property (strong) NSTextField *label;
@end

@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)notification {
  self.window = [[NSWindow alloc]
      initWithContentRect:NSMakeRect(0, 0, 400, 300)
                styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |
                          NSWindowStyleMaskMiniaturizable
                  backing:NSBackingStoreBuffered
                    defer:NO];

  NSTextField *label = [NSTextField labelWithString:@"Hello, world!"];
  [label setAlignment:NSTextAlignmentCenter];
  [label setTranslatesAutoresizingMaskIntoConstraints:NO];

  [self.window.contentView addSubview:label];
  [NSLayoutConstraint activateConstraints:@[
    [label.centerXAnchor
        constraintEqualToAnchor:self.window.contentView.centerXAnchor],
    [label.centerYAnchor
        constraintEqualToAnchor:self.window.contentView.centerYAnchor]
  ]];

  [self.window setTitle:@"Hello World"];
  [self.window center];
  [self.window makeKeyAndOrderFront:nil];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}
@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        [NSApplication sharedApplication];
        AppDelegate *delegate = [[AppDelegate alloc] init];
        [NSApp setDelegate:delegate];
        [NSApp run];
    }
    return 0;
}
