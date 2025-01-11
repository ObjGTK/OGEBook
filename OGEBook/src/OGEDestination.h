/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libebook/libebook.h>

#import <OGObject/OGObject.h>

@class OGEBookClient;
@class OGEContact;

@interface OGEDestination : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Exports multiple #EDestination elements to a single XML document.
 *
 * @param destv a %NULL-terminated array of pointers to #EDestination
 * @return An XML string, allocated with g_malloc.
 */
+ (OFString*)exportv:(EDestination**)destv;

/**
 * Unrefs the elements of @destv and frees @destv itself.
 *
 * @param destv a %NULL-terminated array of pointers to #EDestination
 */
+ (void)freev:(EDestination**)destv;

/**
 * Generates a joint text representation of all the #EDestination
 * elements in @destv.
 *
 * @param destv %NULL-terminated array of pointers to #EDestination
 * @return The text representation of @destv.
 */
+ (OFString*)textrepv:(EDestination**)destv;

/**
 * Creates an #EDestination from an XML document.
 *
 * @param str an XML string
 * @return An #EDestination, or %NULL if the document was not
 * well-formed.
 */
+ (OGEDestination*)import:(OFString*)str;

/**
 * Creates an array of pointers to #EDestination elements
 * from an XML document.
 *
 * @param str an XML string
 * @return A %NULL-terminated
 * array of pointers to #EDestination elements.
 */
+ (EDestination**)importv:(OFString*)str;

/**
 * Constructors
 */
+ (instancetype)destination;

/**
 * Methods
 */

- (EDestination*)castedGObject;

/**
 * Creates a new #EDestination identical to @dest.
 *
 * @return A newly created #EDestination, identical to @dest.
 */
- (OGEDestination*)copy;

/**
 * Checks if @dest is blank.
 *
 * @return %TRUE if @dest is empty, %FALSE otherwise.
 */
- (bool)empty;

/**
 * Checks if @a and @b are equal.
 *
 * @param b an #EDestination
 * @return %TRUE if the destinations are equal, %FALSE otherwise.
 */
- (bool)equal:(const EDestination*)b;

/**
 * Exports a destination to an XML document.
 *
 * @return An XML string, allocated with g_malloc.
 */
- (OFString*)export;

/**
 * Exports the contact information from @dest to parameters
 * and values in @attr, suitable for an address book.
 *
 * @param attr an #EVCardAttribute
 */
- (void)exportToVcardAttribute:(EVCardAttribute*)attr;

/**
 * Gets the encoded name and email address, or in the case of lists, the
 * encoded list of email addresses, from @dest.  The returned string is
 * suitable for use in an email header, but not for displaying to users.
 *
 * @return an encoded destination string suitable for use in an
 *          email header, or %NULL if the destination was empty
 */
- (OFString*)address;

/**
 * Gets the contact @dest is pointing to, if any.
 *
 * @return An #EContact, or %NULL if none was set.
 */
- (OGEContact*)contact;

/**
 * Gets the unique contact ID @dest is pointing to, if any.
 *
 * @return A unique contact ID, or %NULL if none was set.
 */
- (OFString*)contactUid;

/**
 * Gets the e-mail address of @dest's addressee.
 *
 * @return An e-mail address, or an empty string if none was set.
 */
- (OFString*)email;

/**
 * Gets the index of the e-mail address of the contact that
 * @dest is pointing to, if any.
 *
 * @return The e-mail index, or -1 if none was set.
 */
- (gint)emailNum;

/**
 * Check if @dest wants to get mail formatted as HTML.
 *
 * @return %TRUE if destination wants HTML, %FALSE if not.
 */
- (bool)htmlMailPref;

/**
 * Gets the full name of @dest's addressee, or if the addressee is
 * a contact list, the name the list was filed under. The name can
 * be encoded in quoted printable.
 *
 * @return The full name of the addressee, or %NULL if none was set.
 */
- (OFString*)name;

/**
 * Gets the unique source ID @dest is pointing to, if any. The source
 * ID specifies which address book @dest's contact came from.
 *
 * @return A unique source ID, or %NULL if none was set.
 */
- (OFString*)sourceUid;

/**
 * Generates a textual representation of @dest, suitable for referring
 * to the destination during user interaction. The name can be encoded
 * in quoted printable.
 *
 * @param includeEmail whether to include the e-mail address
 * @return A textual representation of the destination.
 */
- (OFString*)textrep:(bool)includeEmail;

/**
 * Checks if @dest is flagged as an automatic recipient, meaning
 * it was not explicitly specified by the user. This can be used
 * to hide it from some UI elements.
 *
 * @return %TRUE if destination is an auto recipient, %FALSE otherwise.
 */
- (bool)isAutoRecipient;

/**
 * Checks if @dest is a list of addresses.
 *
 * @return %TRUE if destination is a list, %FALSE if it is an individual.
 */
- (bool)isEvolutionList;

/**
 * Check if @dest is to be ignored.
 *
 * @return %TRUE if this destination should be ignored, else %FALSE.
 */
- (bool)isIgnored;

/**
 * If @dest is a list, gets recursively list of all destinations.
 * Everything returned from this function belongs to @dest and
 * thus should not be freed.
 *
 * @return A list of elements of type
 * #EDestination, or %NULL.
 */
- (const GList*)listGetDests;

/**
 * If @dest is a list, gets the list of EDestinations assigned directly
 * to @dest.
 * The list and its elements belong to @dest, and should not be freed.
 *
 * @return A list of elements of type
 * #EDestination, or %NULL.
 */
- (const GList*)listGetRootDests;

/**
 * If @dest is a list, checks if the addresses in the list
 * should be presented to the user during interaction.
 *
 * @return %TRUE if addresses should be shown, %FALSE otherwise.
 */
- (bool)listShowAddresses;

/**
 * Sets the flag indicating if @dest is an automatic recipient, meaning
 * it was not explicitly specified by the user. This can be used
 * to hide it from some UI elements.
 *
 * @param value the auto recipient flag
 */
- (void)setAutoRecipient:(bool)value;

/**
 * Specify the source @dest's contact comes from. This is useful
 * if you need to update the contact later.
 *
 * @param client an #EBookClient
 */
- (void)setClient:(OGEBookClient*)client;

/**
 * Sets @dest to point to one of @contact's e-mail addresses
 * indicated by @email_num.
 *
 * @param contact an #EContact
 * @param emailNum an email index
 */
- (void)setContactWithContact:(OGEContact*)contact emailNum:(gint)emailNum;

/**
 * Sets @dest to point to one of the contact specified by @uid's e-mail
 * addresses indicated by @email_num.
 *
 * @param uid a unique contact ID
 * @param emailNum an email index
 */
- (void)setContactUidWithUid:(OFString*)uid emailNum:(gint)emailNum;

/**
 * Sets the e-mail address of @dest's addressee.
 *
 * @param email the destination's e-mail address
 */
- (void)setEmail:(OFString*)email;

/**
 * Specifies whether @dest wants to get mail formatted as HTML.
 *
 * @param flag whether the destination wants HTML mail
 */
- (void)setHtmlMailPref:(bool)flag;

/**
 * Set the ignore flag on an #EDestination.
 *
 * @param ignored %TRUE if this #EDestination should be ignored.
 */
- (void)setIgnored:(bool)ignored;

/**
 * Sets the full name of @dest's addressee.
 *
 * @param name the destination's full name
 */
- (void)setName:(OFString*)name;

/**
 * Sets @dest to point to the name and e-mail address resulting from
 * parsing the supplied string. Useful for user input.
 *
 * @param raw an unparsed string
 */
- (void)setRaw:(OFString*)raw;

@end