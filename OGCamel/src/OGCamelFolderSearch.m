/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolderSearch.h"

#import "OGCamelMessageInfo.h"
#import "OGCamelIndex.h"
#import "OGCamelFolder.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelFolderSearch

+ (time_t)utilAddMonthsWithT:(time_t)t months:(gint)months
{
	time_t returnValue = camel_folder_search_util_add_months(t, months);

	return returnValue;
}

+ (gint)utilCompareDateWithDatetime1:(gint64)datetime1 datetime2:(gint64)datetime2
{
	gint returnValue = camel_folder_search_util_compare_date(datetime1, datetime2);

	return returnValue;
}

+ (guint64)utilHashMessageIdWithMessageId:(OFString*)messageId needsDecode:(bool)needsDecode
{
	guint64 returnValue = camel_folder_search_util_hash_message_id([messageId UTF8String], needsDecode);

	return returnValue;
}

+ (time_t)utilMakeTimeWithArgc:(gint)argc argv:(CamelSExpResult**)argv
{
	time_t returnValue = camel_folder_search_util_make_time(argc, argv);

	return returnValue;
}

- (instancetype)init
{
	CamelFolderSearch* gobjectValue = CAMEL_FOLDER_SEARCH(camel_folder_search_new());

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

- (CamelFolderSearch*)castedGObject
{
	return CAMEL_FOLDER_SEARCH([self gObject]);
}

- (guint32)countWithExpr:(OFString*)expr cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	guint32 returnValue = camel_folder_search_count([self castedGObject], [expr UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)freeResult:(GPtrArray*)result
{
	camel_folder_search_free_result([self castedGObject], result);
}

- (OGCamelMessageInfo*)currentMessageInfo
{
	CamelMessageInfo* gobjectValue = CAMEL_MESSAGE_INFO(camel_folder_search_get_current_message_info([self castedGObject]));

	OGCamelMessageInfo* returnValue = [OGCamelMessageInfo wrapperFor:gobjectValue];
	return returnValue;
}

- (GPtrArray*)currentSummary
{
	GPtrArray* returnValue = camel_folder_search_get_current_summary([self castedGObject]);

	return returnValue;
}

- (OGCamelFolder*)folder
{
	CamelFolder* gobjectValue = CAMEL_FOLDER(camel_folder_search_get_folder([self castedGObject]));

	OGCamelFolder* returnValue = [OGCamelFolder wrapperFor:gobjectValue];
	return returnValue;
}

- (bool)onlyCachedMessages
{
	bool returnValue = camel_folder_search_get_only_cached_messages([self castedGObject]);

	return returnValue;
}

- (GPtrArray*)summary
{
	GPtrArray* returnValue = camel_folder_search_get_summary([self castedGObject]);

	return returnValue;
}

- (bool)summaryEmpty
{
	bool returnValue = camel_folder_search_get_summary_empty([self castedGObject]);

	return returnValue;
}

- (GPtrArray*)searchWithExpr:(OFString*)expr uids:(GPtrArray*)uids cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GPtrArray* returnValue = camel_folder_search_search([self castedGObject], [expr UTF8String], uids, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

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