/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceAlarms : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceAlarms*)SOURCEALARMS;

/**
 * Thread-safe variation of e_source_alarms_get_last_notified().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceAlarms:last-notified
 */
- (OFString*)dupLastNotified;

/**
 * Returns whether the user should be alerted about upcoming appointments
 * in the calendar described by the #ESource to which @extension belongs.
 * 
 * Alarm daemons such as evolution-alarm-notify can use this property to
 * decide which calendars to query for upcoming appointments.
 *
 * @return whether to show alarms for upcoming appointments
 */
- (bool)includeMe;

/**
 * Returns an ISO 8601 formatted timestamp of when the user was last
 * alerted about an upcoming appointment in the calendar described by
 * the #ESource to which @extension belongs.  If no valid timestamp
 * has been set, the function will return %NULL.
 *
 * @return an ISO 8601 timestamp, or %NULL
 */
- (OFString*)lastNotified;

/**
 * Sets whether the user should be alerted about upcoming appointments in
 * the calendar described by the #ESource to which @extension belongs.
 * 
 * Alarm daemons such as evolution-alarm-notify can use this property to
 * decide which calendars to query for upcoming appointments.
 *
 * @param includeMe whether to show alarms for upcoming appointments
 */
- (void)setIncludeMe:(bool)includeMe;

/**
 * Sets an ISO 8601 formatted timestamp of when the user was last
 * alerted about an upcoming appointment in the calendar described
 * by the #ESource to which @extension belongs.
 * 
 * If @last_notified is non-%NULL, the function will validate the
 * timestamp before setting the #ESourceAlarms:last-notified property.
 * Invalid timestamps are discarded with a runtime warning.
 * 
 * Generally, this function should only be called by an alarm daemon
 * such as evolution-alarm-notify.
 *
 * @param lastNotified an ISO 8601 timestamp, or %NULL
 */
- (void)setLastNotified:(OFString*)lastNotified;

@end