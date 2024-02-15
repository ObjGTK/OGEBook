/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterDriver.h"

#import "OGCamelMessageInfo.h"
#import "OGCamelFolder.h"
#import <OGio/OGCancellable.h>
#import "OGCamelSession.h"
#import "OGCamelMimeMessage.h"

@implementation OGCamelFilterDriver

- (instancetype)init:(OGCamelSession*)session
{
	CamelFilterDriver* gobjectValue = CAMEL_FILTER_DRIVER(camel_filter_driver_new([session castedGObject]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelFilterDriver*)castedGObject
{
	return CAMEL_FILTER_DRIVER([self gObject]);
}

- (void)addRuleWithName:(OFString*)name match:(OFString*)match action:(OFString*)action
{
	camel_filter_driver_add_rule([self castedGObject], [name UTF8String], [match UTF8String], [action UTF8String]);
}

- (gint)filterFolderWithFolder:(OGCamelFolder*)folder cache:(CamelUIDCache*)cache uids:(GPtrArray*)uids remove:(bool)remove cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = camel_filter_driver_filter_folder([self castedGObject], [folder castedGObject], cache, uids, remove, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)filterMboxWithMbox:(OFString*)mbox originalSourceUrl:(OFString*)originalSourceUrl cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = camel_filter_driver_filter_mbox([self castedGObject], [mbox UTF8String], [originalSourceUrl UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)filterMessageWithMessage:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info uid:(OFString*)uid source:(OGCamelFolder*)source storeUid:(OFString*)storeUid originalStoreUid:(OFString*)originalStoreUid cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = camel_filter_driver_filter_message([self castedGObject], [message castedGObject], [info castedGObject], [uid UTF8String], [source castedGObject], [storeUid UTF8String], [originalStoreUid UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)flush
{
	GError* err = NULL;

	camel_filter_driver_flush([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (bool)removeRuleByName:(OFString*)name
{
	bool returnValue = camel_filter_driver_remove_rule_by_name([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (void)setDefaultFolder:(OGCamelFolder*)def
{
	camel_filter_driver_set_default_folder([self castedGObject], [def castedGObject]);
}

- (void)setFolderFuncWithGetFolder:(CamelFilterGetFolderFunc)getFolder userData:(gpointer)userData
{
	camel_filter_driver_set_folder_func([self castedGObject], getFolder, userData);
}

- (void)setLogfile:(FILE*)logfile
{
	camel_filter_driver_set_logfile([self castedGObject], logfile);
}

- (void)setPlaySoundFuncWithFunc:(CamelFilterPlaySoundFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_play_sound_func([self castedGObject], func, userData);
}

- (void)setShellFuncWithFunc:(CamelFilterShellFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_shell_func([self castedGObject], func, userData);
}

- (void)setStatusFuncWithFunc:(CamelFilterStatusFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_status_func([self castedGObject], func, userData);
}

- (void)setSystemBeepFuncWithFunc:(CamelFilterSystemBeepFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_system_beep_func([self castedGObject], func, userData);
}


@end