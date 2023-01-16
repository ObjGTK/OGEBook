/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolderSearch.h"

#import "OGCamelFolder.h"
#import "OGCamelIndex.h"
#import "OGCamelMessageInfo.h"

@implementation OGCamelFolderSearch

+ (time_t)utilAddMonthsWithT:(time_t)t months:(gint)months
{
	return camel_folder_search_util_add_months(t, months);
}

+ (gint)utilCompareDateWithDatetime1:(gint64)datetime1 datetime2:(gint64)datetime2
{
	return camel_folder_search_util_compare_date(datetime1, datetime2);
}

+ (time_t)utilMakeTimeWithArgc:(gint)argc argv:(CamelSExpResult**)argv
{
	return camel_folder_search_util_make_time(argc, argv);
}

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_folder_search_new()];

	return self;
}

- (CamelFolderSearch*)FOLDERSEARCH
{
	return CAMEL_FOLDER_SEARCH([self GOBJECT]);
}

- (guint32)countWithExpr:(OFString*)expr cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_search_count([self FOLDERSEARCH], [expr UTF8String], cancellable, err);
}

- (void)freeResult:(GPtrArray*)result
{
	camel_folder_search_free_result([self FOLDERSEARCH], result);
}

- (OGCamelMessageInfo*)currentMessageInfo
{
	return [[[OGCamelMessageInfo alloc] initWithGObject:(GObject*)camel_folder_search_get_current_message_info([self FOLDERSEARCH])] autorelease];
}

- (GPtrArray*)currentSummary
{
	return camel_folder_search_get_current_summary([self FOLDERSEARCH]);
}

- (OGCamelFolder*)folder
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_folder_search_get_folder([self FOLDERSEARCH])] autorelease];
}

- (bool)onlyCachedMessages
{
	return camel_folder_search_get_only_cached_messages([self FOLDERSEARCH]);
}

- (GPtrArray*)summary
{
	return camel_folder_search_get_summary([self FOLDERSEARCH]);
}

- (bool)summaryEmpty
{
	return camel_folder_search_get_summary_empty([self FOLDERSEARCH]);
}

- (GPtrArray*)searchWithExpr:(OFString*)expr uids:(GPtrArray*)uids cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_folder_search_search([self FOLDERSEARCH], [expr UTF8String], uids, cancellable, err);
}

- (void)setBodyIndex:(OGCamelIndex*)bodyIndex
{
	camel_folder_search_set_body_index([self FOLDERSEARCH], [bodyIndex INDEX]);
}

- (void)setCurrentMessageInfo:(OGCamelMessageInfo*)info
{
	camel_folder_search_set_current_message_info([self FOLDERSEARCH], [info MESSAGEINFO]);
}

- (void)setFolder:(OGCamelFolder*)folder
{
	camel_folder_search_set_folder([self FOLDERSEARCH], [folder FOLDER]);
}

- (void)setOnlyCachedMessages:(bool)onlyCachedMessages
{
	camel_folder_search_set_only_cached_messages([self FOLDERSEARCH], onlyCachedMessages);
}

- (void)setSummary:(GPtrArray*)summary
{
	camel_folder_search_set_summary([self FOLDERSEARCH], summary);
}

- (void)takeCurrentMessageInfo:(OGCamelMessageInfo*)info
{
	camel_folder_search_take_current_message_info([self FOLDERSEARCH], [info MESSAGEINFO]);
}


@end