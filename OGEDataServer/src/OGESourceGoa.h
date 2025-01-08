/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceGoa : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceGoa*)castedGObject;

/**
 * Thread-safe variation of e_source_goa_get_account_id().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceGoa:account-id
 */
- (OFString*)dupAccountId;

/**
 * Thread-safe variation of e_source_goa_get_address().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceGoa:address
 */
- (OFString*)dupAddress;

/**
 * Thread-safe variation of e_source_goa_get_calendar_url().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceGoa:calendar-url
 */
- (OFString*)dupCalendarUrl;

/**
 * Thread-safe variation of e_source_goa_get_contacts_url().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceGoa:contacts-url
 */
- (OFString*)dupContactsUrl;

/**
 * Thread-safe variation of e_source_goa_get_name().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceGoa:name
 */
- (OFString*)dupName;

/**
 * Returns the identifier string of the GNOME Online Account associated
 * with the #ESource to which @extension belongs.
 *
 * @return the associated GNOME Online Account ID
 */
- (OFString*)accountId;

/**
 * Returns the original Address of the GNOME Online Account associated
 * with the #ESource to which @extension belongs. Can be %NULL or an empty
 * string when not filled.
 *
 * @return the associated GNOME Online Account's Address
 */
- (OFString*)address;

/**
 * Returns the calendar URL string of the GNOME Online Account associated
 * with the #ESource to which @extension belongs. Can be %NULL or an empty
 * string for accounts not supporting this property.
 *
 * @return the associated GNOME Online Account calendar URL
 */
- (OFString*)calendarUrl;

/**
 * Returns the contacts URL string of the GNOME Online Account associated
 * with the #ESource to which @extension belongs. Can be %NULL or an empty
 * string for accounts not supporting this property.
 *
 * @return the associated GNOME Online Account contacts URL
 */
- (OFString*)contactsUrl;

/**
 * Returns the original Name of the GNOME Online Account associated
 * with the #ESource to which @extension belongs. Can be %NULL or an empty
 * string when not filled.
 *
 * @return the associated GNOME Online Account's Name
 */
- (OFString*)name;

/**
 * Sets the identifier string of the GNOME Online Account associated
 * with the #ESource to which @extension belongs.
 * 
 * The internal copy of @account_id is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param accountId the associated GNOME Online Account ID, or %NULL
 */
- (void)setAccountId:(OFString*)accountId;

/**
 * Sets the Address of the GNOME Online Account associated
 * with the #ESource to which @extension belongs.
 * 
 * The internal copy of @address is automatically stripped of leading
 * and trailing whitespace. If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param address the associated GNOME Online Account's Address, or %NULL
 */
- (void)setAddress:(OFString*)address;

/**
 * Sets the calendar URL of the GNOME Online Account associated
 * with the #ESource to which @extension belongs.
 * 
 * The internal copy of @calendar_url is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param calendarUrl the associated GNOME Online Account
 *                calendar URL, or %NULL
 */
- (void)setCalendarUrl:(OFString*)calendarUrl;

/**
 * Sets the contacts URL of the GNOME Online Account associated
 * with the #ESource to which @extension belongs.
 * 
 * The internal copy of @contacts_url is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param contactsUrl the associated GNOME Online Account
 *                contacts URL, or %NULL
 */
- (void)setContactsUrl:(OFString*)contactsUrl;

/**
 * Sets the Name of the GNOME Online Account associated
 * with the #ESource to which @extension belongs.
 * 
 * The internal copy of @name is automatically stripped of leading
 * and trailing whitespace. If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param name the associated GNOME Online Account's Name, or %NULL
 */
- (void)setName:(OFString*)name;

@end