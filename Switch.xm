#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>
#import <spawn.h>

@interface Respring10Switch : NSObject <FSSwitchDataSource>
@end

static FSSwitchState state;

@implementation Respring10Switch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	return state;
}

-(void)respring {
    pid_t pid;
    int status;
    const char* args[] = { "killall", "-9", "SpringBoard", NULL };
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	
	switch (newState) {
	case FSSwitchStateIndeterminate:
		break;
	case FSSwitchStateOn:
		state = FSSwitchStateOn;
		[self respring];
		break;
	case FSSwitchStateOff:
		state = FSSwitchStateOff;
		break;
	}
	return;
}

@end
