#import <React/RCTBridgeModule.h>

@interface XRNEnvConfig : NSObject <RCTBridgeModule>

+ (NSDictionary *)env;
+ (NSString *)envFor: (NSString *)key;

@end
