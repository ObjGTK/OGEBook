/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEVCard.h"

@interface OGEContact : OGEVCard
{

}

/**
 * Functions
 */

/**
 * Gets the #EContactField corresponding to the @field_name.
 *
 * @param fieldName a string representing a contact field
 * @return An #EContactField corresponding to @field_name, or 0 if it doesn't exist.
 */
+ (EContactField)fieldId:(OFString*)fieldName;

/**
 * Gets the #EContactField corresponding to the @vcard_field.
 *
 * @param vcardField a string representing a vCard field
 * @return An #EContactField corresponding to @vcard_field, or 0 if it doesn't exist.
 */
+ (EContactField)fieldIdFromVcard:(OFString*)vcardField;

/**
 * Returns whether the @field_id is of a string type,
 * thus it can be used with e_contact_get_const().
 *
 * @param fieldId an #EContactField
 * @return Whether the @field_id is of a string type.
 */
+ (bool)fieldIsString:(EContactField)fieldId;

/**
 * Gets the string representation of @field_id.
 *
 * @param fieldId an #EContactField
 * @return The string representation of @field_id
 */
+ (OFString*)fieldName:(EContactField)fieldId;

/**
 * Gets the #GType used for this contact field, this indicates
 * what kind of value can be passed to e_contact_set().
 *
 * @param fieldId an #EContactField
 * @return The #GType used for @field_id, or %G_TYPE_INVALID if it doesn't exist.
 */
+ (GType)fieldType:(EContactField)fieldId;

/**
 * Gets a human-readable, translated string representation
 * of @field_id.
 *
 * @param fieldId an #EContactField
 * @return The human-readable representation of @field_id
 */
+ (OFString*)prettyName:(EContactField)fieldId;

/**
 * Gets the vcard attribute corresponding to @field_id, as a string.
 *
 * @param fieldId an #EContactField
 * @return The vcard attribute corresponding to @field_id
 */
+ (OFString*)vcardAttribute:(EContactField)fieldId;

/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initFromVcard:(OFString*)vcard;
- (instancetype)initFromVcardWithUidWithVcard:(OFString*)vcard uid:(OFString*)uid;

/**
 * Methods
 */

- (EContact*)castedGObject;

/**
 * Creates a copy of @contact.
 *
 * @return A new #EContact identical to @contact.
 */
- (OGEContact*)duplicate;

/**
 * Gets the value of @contact's field specified by @field_id.
 *
 * @param fieldId an #EContactField
 * @return Depends on the field's type, owned by the caller. This may be %NULL if the field isn't set.
 */
- (gpointer)get:(EContactField)fieldId;

/**
 * Gets a list of the vcard attributes for @contact's @field_id.
 *
 * @param fieldId an #EContactField
 * @return A #GList of pointers
 * to #EVCardAttribute, owned by the caller.
 */
- (GList*)attributes:(EContactField)fieldId;

/**
 * Gets a list of the vcard attributes for @contact's @field_ids.
 *
 * @param fieldIds an array of #EContactField
 * @param size number of elements in field_ids
 * @return A #GList of pointers
 * to #EVCardAttribute, owned by the caller.
 */
- (GList*)attributesSetWithFieldIds:(const EContactField*)fieldIds size:(gint)size;

/**
 * Gets the value of @contact's field specified by @field_id, caching
 * the result so it can be freed later. Use e_contact_field_is_string()
 * to check whether the field can be used here.
 *
 * @param fieldId an #EContactField
 * @return Depends on the field's type, owned by the
 * #EContact.
 */
- (gconstpointer)const:(EContactField)fieldId;

/**
 * Tries to modify any #EContactPhoto fields which are
 * stored on the local file system as type %E_CONTACT_PHOTO_TYPE_URI
 * to be inlined and stored as %E_CONTACT_PHOTO_TYPE_INLINED instead.
 *
 * @return %TRUE if there were no errors, upon error %FALSE is returned
 *    and @error is set.
 */
- (bool)inlineLocalPhotos;

/**
 * Sets the value of @contact's field specified by @field_id to @value.
 *
 * @param fieldId an #EContactField
 * @param value a value whose type depends on the @field_id
 */
- (void)setWithFieldId:(EContactField)fieldId value:(gconstpointer)value;

/**
 * Sets the vcard attributes for @contact's @field_id.
 * Attributes are added to the contact in the same order as they are in @attributes.
 *
 * @param fieldId an #EContactField
 * @param attributes a #GList of pointers to #EVCardAttribute
 */
- (void)setAttributesWithFieldId:(EContactField)fieldId attributes:(GList*)attributes;

@end