#import "MenghabitPlugin.h"
#if __has_include(<menghabit/menghabit-Swift.h>)
#import <menghabit/menghabit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "menghabit-Swift.h"
#endif

@implementation MenghabitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMenghabitPlugin registerWithRegistrar:registrar];
}
@end
