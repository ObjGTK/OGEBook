/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelMessageInfo;
@class OGCamelIndex;
@class OGCamelFolder;
@class OGCancellable;

@interface OGCamelFolderSearch : OGObject
{

}

/**
 * Functions
 */

/**
 * Increases time @t by the given number of months (or decreases, if
 * @months is negative).
 *
 * @param t Initial time
 * @param months number of months to add or subtract
 * @return a new #time_t value
 */
+ (time_t)utilAddMonthsWithT:(time_t)t months:(gint)months;

/**
 * Compares date portion of the two date-time values, first converted
 * into the local time zone. The returned value is like with strcmp().
 *
 * @param datetime1 a time_t-like value of the first date-time
 * @param datetime2 a time_t-like value of the second date-time
 * @return 0 when the dates are equal, < 0 when first is before second and
 *    > 0 when the first is after the second date
 */
+ (gint)utilCompareDateWithDatetime1:(gint64)datetime1 datetime2:(gint64)datetime2;

/**
 * Calculates a hash of the Message-ID header value @message_id.
 *
 * @param messageId a raw Message-ID header value
 * @param needsDecode whether the @message_id requires camel_header_msgid_decode() first
 * @return hash of the @message_id, or 0 on any error.
 */
+ (guint64)utilHashMessageIdWithMessageId:(OFString*)messageId needsDecode:(bool)needsDecode;

/**
 * Implementation of 'make-time' function, which expects one argument,
 * a string or an integer, to be converted into time_t.
 *
 * @param argc number of arguments in @argv
 * @param argv array or arguments
 * @return time_t equivalent of the passed in argument, or (time_t) -1 on error.
 */
+ (time_t)utilMakeTimeWithArgc:(gint)argc argv:(CamelSExpResult**)argv;

/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelFolderSearch*)castedGObject;

/**
 * Run a search.  Search must have had Folder already set on it, and
 * it must implement summaries.
 *
 * @param expr a search expression to run
 * @param cancellable a #GCancellable
 * @return Number of messages that match the query.
 */
- (guint32)countWithExpr:(OFString*)expr cancellable:(OGCancellable*)cancellable;

/**
 * Frees result of camel_folder_search_search() call.
 *
 * @param result a result to free
 */
- (void)freeResult:(GPtrArray*)result;

/**
 *
 * @return the currently processing #CamelMessageInfo
 */
- (OGCamelMessageInfo*)currentMessageInfo;

/**
 *
 * @return the current summary, and array
 *   of message info UID-s to use.
 */
- (GPtrArray*)currentSummary;

/**
 *
 * @return a #CamelFolder for which the @search is currently running.
 */
- (OGCamelFolder*)folder;

/**
 *
 * @return Whether only cached messages can be searched. See
 *    camel_folder_search_set_only_cached_messages() for more
 *    information what it means.
 */
- (bool)onlyCachedMessages;

/**
 *
 * @return A summary of UID-s of #CamelMessageInfo
 *   previously set by camel_folder_search_set_summary().
 */
- (GPtrArray*)summary;

/**
 *
 * @return Whether the summary (as returned by camel_folder_search_get_summary()) is empty.
 *   It returns %FALSE when the summary is set and contains at least one item.
 */
- (bool)summaryEmpty;

/**
 * Run a search.  Search must have had Folder already set on it, and
 * it must implement summaries.
 *
 * @param expr a search expression to run
 * @param uids to search against, NULL for all uid's.
 * @param cancellable a #GCancellable
 * @return a #GPtrArray with matching UIDs,
 *    or %NULL on error. Use camel_folder_search_free_result() to free it when
 *    no longer needed.
 */
- (GPtrArray*)searchWithExpr:(OFString*)expr uids:(GPtrArray*)uids cancellable:(OGCancellable*)cancellable;

/**
 * Set the index representing the contents of all messages
 * in this folder.  If this is not set, then the folder implementation
 * should sub-class the CamelFolderSearch and provide its own
 * body-contains function.
 *
 * @param bodyIndex a #CamelIndex
 */
- (void)setBodyIndex:(OGCamelIndex*)bodyIndex;

/**
 * Sets, or unsets, the @info as the currently processing #CamelMessageInfo.
 * The function adds its own reference to @info, if not %NULL.
 *
 * @param info a #CamelMessageInfo
 */
- (void)setCurrentMessageInfo:(OGCamelMessageInfo*)info;

/**
 * Set the folder attribute of the search. This can be used to perform a slow-search
 * when indexes and so forth are not available. Or for use by subclasses.
 *
 * @param folder a #CamelFolder
 */
- (void)setFolder:(OGCamelFolder*)folder;

/**
 * Sets whether only locally cached messages can be searched. The default
 * value is %FALSE, which means that when a message is required and it is
 * not available locally, then it is downloaded from the server, if possible.
 *
 * @param onlyCachedMessages a value to set
 */
- (void)setOnlyCachedMessages:(bool)onlyCachedMessages;

/**
 * Set the array of summary objects representing the span of the search.
 * 
 * If this is not set, then a subclass must provide the functions
 * for searching headers and for the match-all operator.
 *
 * @param summary An array of UID-s of #CamelMessageInfo.
 */
- (void)setSummary:(GPtrArray*)summary;

/**
 * Sets, or unsets, the @info as the currently processing #CamelMessageInfo.
 * Unlike camel_folder_search_set_current_message_info(), this function
 * assumes ownership of the @info, if not %NULL.
 *
 * @param info a #CamelMessageInfo
 */
- (void)takeCurrentMessageInfo:(OGCamelMessageInfo*)info;

@end