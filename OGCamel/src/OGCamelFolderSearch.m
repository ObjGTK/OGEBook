/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolderSearch.h"

#import "OGCamelFolder.h"
#import "OGCamelIndex.h"
#import "OGCamelMessageInfo.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelFolderSearch

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_FOLDER_SEARCH;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (time_t)utilAddMonthsWithT:(time_t)t months:(gint)months
{
	time_t returnValue = (time_t)camel_folder_search_util_add_months(t, months);

	return returnValue;
}

+ (gint)utilCompareDateWithDatetime1:(gint64)datetime1 datetime2:(gint64)datetime2
{
	gint returnValue = (gint)camel_folder_search_util_compare_date(datetime1, datetime2);

	return returnValue;
}

+ (guint64)utilHashMessageIdWithMessageId:(OFString*)messageId needsDecode:(bool)needsDecode
{
	guint64 returnValue = (guint64)camel_folder_search_util_hash_message_id([messageId UTF8String], needsDecode);

	return returnValue;
}

+ (time_t)utilMakeTimeWithArgc:(gint)argc argv:(CamelSExpResult**)argv
{
	time_t returnValue = (time_t)camel_folder_search_util_make_time(argc, argv);

	return returnValue;
}

+ (instancetype)folderSearch
{
	CamelFolderSearch* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_folder_search_new(), CamelFolderSearch, CamelFolderSearch);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelFolderSearch* wrapperObject;
	@try {
		wrapperObject = [[OGCamelFolderSearch alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelFolderSearch*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelFolderSearch, CamelFolderSearch);
}

- (guint32)countWithExpr:(OFString*)expr cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	guint32 returnValue = (guint32)camel_folder_search_count([self castedGObject], [expr UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)freeResult:(GPtrArray*)result
{
	camel_folder_search_free_result([self castedGObject], result);
}

- (OGCamelMessageInfo*)currentMessageInfo
{
	CamelMessageInfo* gobjectValue = camel_folder_search_get_current_message_info([self castedGObject]);

	OGCamelMessageInfo* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GPtrArray*)currentSummary
{
	GPtrArray* returnValue = (GPtrArray*)camel_folder_search_get_current_summary([self castedGObject]);

	return returnValue;
}

- (OGCamelFolder*)folder
{
	CamelFolder* gobjectValue = camel_folder_search_get_folder([self castedGObject]);

	OGCamelFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)onlyCachedMessages
{
	bool returnValue = (bool)camel_folder_search_get_only_cached_messages([self castedGObject]);

	return returnValue;
}

- (GPtrArray*)summary
{
	GPtrArray* returnValue = (GPtrArray*)camel_folder_search_get_summary([self castedGObject]);

	return returnValue;
}

- (bool)summaryEmpty
{
	bool returnValue = (bool)camel_folder_search_get_summary_empty([self castedGObject]);

	return returnValue;
}

- (GPtrArray*)searchWithExpr:(OFString*)expr uids:(GPtrArray*)uids cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GPtrArray* returnValue = (GPtrArray*)camel_folder_search_search([self castedGObject], [expr UTF8String], uids, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setBodyIndex:(OGCamelIndex*)bodyIndex
{
	camel_folder_search_set_body_index([self castedGObject], [bodyIndex castedGObject]);
}

- (void)setCurrentMessageInfo:(OGCamelMessageInfo*)info
{
	camel_folder_search_set_current_message_info([self castedGObject], [info castedGObject]);
}

- (void)setFolder:(OGCamelFolder*)folder
{
	camel_folder_search_set_folder([self castedGObject], [folder castedGObject]);
}

- (void)setOnlyCachedMessages:(bool)onlyCachedMessages
{
	camel_folder_search_set_only_cached_messages([self castedGObject], onlyCachedMessages);
}

- (void)setSummary:(GPtrArray*)summary
{
	camel_folder_search_set_summary([self castedGObject], summary);
}

- (void)takeCurrentMessageInfo:(OGCamelMessageInfo*)info
{
	camel_folder_search_take_current_message_info([self castedGObject], [info castedGObject]);
}


@end