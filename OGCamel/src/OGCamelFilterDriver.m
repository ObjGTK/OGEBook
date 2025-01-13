/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFilterDriver.h"

#import "OGCamelFolder.h"
#import "OGCamelMessageInfo.h"
#import "OGCamelMimeMessage.h"
#import "OGCamelSession.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelFilterDriver

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_FILTER_DRIVER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)filterDriverWithSession:(OGCamelSession*)session
{
	CamelFilterDriver* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_filter_driver_new([session castedGObject]), CamelFilterDriver, CamelFilterDriver);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelFilterDriver* wrapperObject;
	@try {
		wrapperObject = [[OGCamelFilterDriver alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelFilterDriver*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelFilterDriver, CamelFilterDriver);
}

- (void)addRuleWithName:(OFString*)name match:(OFString*)match action:(OFString*)action
{
	camel_filter_driver_add_rule([self castedGObject], [name UTF8String], [match UTF8String], [action UTF8String]);
}

- (gint)filterFolder:(OGCamelFolder*)folder cache:(CamelUIDCache*)cache uids:(GPtrArray*)uids remove:(bool)remove cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = (gint)camel_filter_driver_filter_folder([self castedGObject], [folder castedGObject], cache, uids, remove, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gint)filterMbox:(OFString*)mbox originalSourceUrl:(OFString*)originalSourceUrl cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = (gint)camel_filter_driver_filter_mbox([self castedGObject], [mbox UTF8String], [originalSourceUrl UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gint)filterMessage:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info uid:(OFString*)uid source:(OGCamelFolder*)source storeUid:(OFString*)storeUid originalStoreUid:(OFString*)originalStoreUid cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = (gint)camel_filter_driver_filter_message([self castedGObject], [message castedGObject], [info castedGObject], [uid UTF8String], [source castedGObject], [storeUid UTF8String], [originalStoreUid UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)flush
{
	GError* err = NULL;

	camel_filter_driver_flush([self castedGObject], &err);

	[OGErrorException throwForError:err];

}

- (bool)removeRuleByName:(OFString*)name
{
	bool returnValue = (bool)camel_filter_driver_remove_rule_by_name([self castedGObject], [name UTF8String]);

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

- (void)setPlaySoundFunc:(CamelFilterPlaySoundFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_play_sound_func([self castedGObject], func, userData);
}

- (void)setShellFunc:(CamelFilterShellFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_shell_func([self castedGObject], func, userData);
}

- (void)setStatusFunc:(CamelFilterStatusFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_status_func([self castedGObject], func, userData);
}

- (void)setSystemBeepFunc:(CamelFilterSystemBeepFunc)func userData:(gpointer)userData
{
	camel_filter_driver_set_system_beep_func([self castedGObject], func, userData);
}


@end