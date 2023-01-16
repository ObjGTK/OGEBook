/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterDriver.h"

#import "OGCamelMessageInfo.h"
#import "OGCamelSession.h"
#import "OGCamelFolder.h"
#import "OGCamelMimeMessage.h"

@implementation OGCamelFilterDriver

- (instancetype)init:(OGCamelSession*)session
{
	self = [super initWithGObject:(GObject*)camel_filter_driver_new([session SESSION])];

	return self;
}

- (CamelFilterDriver*)FILTERDRIVER
{
	return CAMEL_FILTER_DRIVER([self GOBJECT]);
}

- (void)addRuleWithName:(OFString*)name match:(OFString*)match action:(OFString*)action
{
	camel_filter_driver_add_rule([self FILTERDRIVER], [name UTF8String], [match UTF8String], [action UTF8String]);
}

- (gint)filterFolderWithFolder:(OGCamelFolder*)folder cache:(CamelUIDCache*)cache uids:(GPtrArray*)uids remove:(bool)remove cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_filter_driver_filter_folder([self FILTERDRIVER], [folder FOLDER], cache, uids, remove, cancellable, err);
}

- (gint)filterMboxWithMbox:(OFString*)mbox originalSourceUrl:(OFString*)originalSourceUrl cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_filter_driver_filter_mbox([self FILTERDRIVER], [mbox UTF8String], [originalSourceUrl UTF8String], cancellable, err);
}

- (gint)filterMessageWithMessage:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info uid:(OFString*)uid source:(OGCamelFolder*)source storeUid:(OFString*)storeUid originalStoreUid:(OFString*)originalStoreUid cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_filter_driver_filter_message([self FILTERDRIVER], [message MIMEMESSAGE], [info MESSAGEINFO], [uid UTF8String], [source FOLDER], [storeUid UTF8String], [originalStoreUid UTF8String], cancellable, err);
}

- (void)flush:(GError**)err
{
	camel_filter_driver_flush([self FILTERDRIVER], err);
}

- (bool)removeRuleByName:(OFString*)name
{
	return camel_filter_driver_remove_rule_by_name([self FILTERDRIVER], [name UTF8String]);
}

- (void)setDefaultFolder:(OGCamelFolder*)def
{
	camel_filter_driver_set_default_folder([self FILTERDRIVER], [def FOLDER]);
}

- (void)setFolderFuncWithGetFolder:(CamelFilterGetFolderFunc)getFolder userData:(gpointer)userData
{
	camel_filter_driver_set_folder_func([self FILTERDRIVER], getFolder, userData);
}

- (void)setLogfile:(FILE*)logfile
{
	camel_filter_driver_set_logfile([self FILTERDRIVER], logfile);
}

- (void)setPlaySoundFuncWithFunc:(CamelFilterPlaySoundFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_play_sound_func([self FILTERDRIVER], func, userData);
}

- (void)setShellFuncWithFunc:(CamelFilterShellFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_shell_func([self FILTERDRIVER], func, userData);
}

- (void)setStatusFuncWithFunc:(CamelFilterStatusFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_status_func([self FILTERDRIVER], func, userData);
}

- (void)setSystemBeepFuncWithFunc:(CamelFilterSystemBeepFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_system_beep_func([self FILTERDRIVER], func, userData);
}


@end