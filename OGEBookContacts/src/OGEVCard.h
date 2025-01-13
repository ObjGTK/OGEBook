/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libebook-contacts/libebook-contacts.h>

#import <OGObject/OGObject.h>

@interface OGEVCard : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Escapes a string according to RFC2426, section 5.
 *
 * @param s the string to escape
 * @return A newly allocated, escaped string.
 */
+ (OFString*)escapeString:(OFString*)s;

/**
 * Unescapes a string according to RFC2426, section 5.
 *
 * @param s the string to unescape
 * @return A newly allocated, unescaped string.
 */
+ (OFString*)unescapeString:(OFString*)s;

/**
 * Constructors
 */
+ (instancetype)vCard;
+ (instancetype)vCardFromString:(OFString*)str;

/**
 * Methods
 */

- (EVCard*)castedGObject;

/**
 * Prepends @attr to @evc. This takes ownership of @attr.
 *
 * @param attr an #EVCardAttribute to add
 */
- (void)addAttribute:(EVCardAttribute*)attr;

/**
 * Prepends @attr to @evcard, setting it to @value. This takes ownership of
 * @attr.
 * 
 * This is a convenience wrapper around e_vcard_attribute_add_value() and
 * e_vcard_add_attribute().
 *
 * @param attr an #EVCardAttribute to add
 * @param value a value to assign to the attribute
 */
- (void)addAttributeWithValue:(EVCardAttribute*)attr value:(OFString*)value;

/**
 * Appends @attr to @evc to the end of a list of attributes. This takes
 * ownership of @attr.
 *
 * @param attr an #EVCardAttribute to append
 */
- (void)appendAttribute:(EVCardAttribute*)attr;

/**
 * Appends @attr to @evcard, setting it to @value. This takes ownership of
 * @attr.
 * 
 * This is a convenience wrapper around e_vcard_attribute_add_value() and
 * e_vcard_append_attribute().
 *
 * @param attr an #EVCardAttribute to append
 * @param value a value to assign to the attribute
 */
- (void)appendAttributeWithValue:(EVCardAttribute*)attr value:(OFString*)value;

/**
 * Constructs the existing #EVCard, @evc, setting its vCard data to @str.
 * 
 * This modifies @evc.
 *
 * @param str a vCard string
 */
- (void)construct:(OFString*)str;

/**
 * Similar to e_vcard_construct_with_uid(), but can also
 * be used with an @str that is not %NULL terminated.
 *
 * @param str a vCard string
 * @param len length of @str, or -1 if @str is %NULL terminated
 * @param uid a unique ID string
 */
- (void)constructFull:(OFString*)str len:(gssize)len uid:(OFString*)uid;

/**
 * Constructs the existing #EVCard, @evc, setting its vCard data to @str, and
 * adding a new UID attribute with the value given in @uid (if @uid is
 * non-%NULL).
 * 
 * This modifies @evc.
 *
 * @param str a vCard string
 * @param uid a unique ID string
 */
- (void)constructWithUid:(OFString*)str uid:(OFString*)uid;

/**
 * Prints a dump of @evc's structure to stdout. Used for
 * debugging.
 *
 */
- (void)dumpStructure;

/**
 * Get the attribute @name from @evc.  The #EVCardAttribute is owned by
 * @evcard and should not be freed. If the attribute does not exist, %NULL is
 * returned.
 * 
 * <note><para>This will only return the <emphasis>first</emphasis> attribute
 * with the given @name. To get other attributes of that name (for example,
 * other <code>TEL</code> attributes if a contact has multiple telephone
 * numbers), use e_vcard_get_attributes() and iterate over the list searching
 * for matching attributes.</para>
 * <para>This method iterates over all attributes in the #EVCard, so should not
 * be called often. If extracting a large number of attributes from a vCard, it
 * is more efficient to iterate once over the list returned by
 * e_vcard_get_attributes().</para></note>
 *
 * @param name the name of the attribute to get
 * @return An #EVCardAttribute if found, or %NULL.
 */
- (EVCardAttribute*)attributeWithName:(OFString*)name;

/**
 * Similar to e_vcard_get_attribute() but this method will not attempt to
 * parse the vCard if it is not already parsed.
 *
 * @param name the name of the attribute to get
 * @return An #EVCardAttribute if found, or %NULL.
 */
- (EVCardAttribute*)attributeIfParsedWithName:(OFString*)name;

/**
 * Gets the list of all attributes from @evcard. The list and its
 * contents are owned by @evcard, and must not be freed.
 *
 * @return A list of attributes
 * of type #EVCardAttribute.
 */
- (GList*)attributes;

/**
 * Check if the @evc has been parsed already, as #EVCard implements lazy parsing
 * of its vCard data. Used for debugging.
 *
 * @return %TRUE if @evc has been parsed, %FALSE otherwise.
 */
- (bool)isParsed;

/**
 * Removes @attr from @evc and frees it. This takes ownership of @attr.
 *
 * @param attr an #EVCardAttribute to remove
 */
- (void)removeAttribute:(EVCardAttribute*)attr;

/**
 * Removes all the attributes with group name and attribute name equal to the
 * passed in values. If @attr_group is %NULL or an empty string,
 * it removes all the attributes with passed in name irrespective of
 * their group names.
 *
 * @param attrGroup group name of attributes to be removed
 * @param attrName name of the arributes to be removed
 */
- (void)removeAttributesWithAttrGroup:(OFString*)attrGroup attrName:(OFString*)attrName;

/**
 * Exports @evc to a string representation, specified
 * by the @format argument.
 *
 * @param format the format to export to
 * @return A newly allocated string representing the vcard.
 */
- (OFString*)toStringWithFormat:(EVCardFormat)format;

/**
 *
 * @param xname the attribute name, which starts with "X-"
 * @return Value of attribute @x_name, or %NULL,
 *    when there is no such attribute. Free the returned pointer with g_free(),
 *    when no longer needed.
 */
- (OFString*)utilDupXattributeWithXname:(OFString*)xname;

/**
 * Sets an "X-" attribute @x_name to value @value in @vcard, or
 * removes it from @vcard, when @value is %NULL.
 *
 * @param xname the attribute name, which starts with "X-"
 * @param value the value to set, or %NULL to unset
 */
- (void)utilSetXattributeWithXname:(OFString*)xname value:(OFString*)value;

@end