/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEContact.h"

@implementation OGEContact

+ (EContactField)fieldId:(OFString*)fieldName
{
	return e_contact_field_id([fieldName UTF8String]);
}

+ (EContactField)fieldIdFromVcard:(OFString*)vcardField
{
	return e_contact_field_id_from_vcard([vcardField UTF8String]);
}

+ (bool)fieldIsString:(EContactField)fieldId
{
	return e_contact_field_is_string(fieldId);
}

+ (OFString*)fieldName:(EContactField)fieldId
{
	return [OFString stringWithUTF8String:e_contact_field_name(fieldId)];
}

+ (GType)fieldType:(EContactField)fieldId
{
	return e_contact_field_type(fieldId);
}

+ (OFString*)prettyName:(EContactField)fieldId
{
	return [OFString stringWithUTF8String:e_contact_pretty_name(fieldId)];
}

+ (OFString*)vcardAttribute:(EContactField)fieldId
{
	return [OFString stringWithUTF8String:e_contact_vcard_attribute(fieldId)];
}

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)e_contact_new()];

	return self;
}

- (instancetype)initFromVcard:(OFString*)vcard
{
	self = [super initWithGObject:(GObject*)e_contact_new_from_vcard([vcard UTF8String])];

	return self;
}

- (instancetype)initFromVcardWithUidWithVcard:(OFString*)vcard uid:(OFString*)uid
{
	self = [super initWithGObject:(GObject*)e_contact_new_from_vcard_with_uid([vcard UTF8String], [uid UTF8String])];

	return self;
}

- (EContact*)CONTACT
{
	return E_CONTACT([self GOBJECT]);
}

- (OGEContact*)duplicate
{
	return [[[OGEContact alloc] initWithGObject:(GObject*)e_contact_duplicate([self CONTACT])] autorelease];
}

- (gpointer)instance:(EContactField)fieldId
{
	return e_contact_get([self CONTACT], fieldId);
}

- (GList*)attributes:(EContactField)fieldId
{
	return e_contact_get_attributes([self CONTACT], fieldId);
}

- (GList*)attributesSetWithFieldIds:(const EContactField*)fieldIds size:(gint)size
{
	return e_contact_get_attributes_set([self CONTACT], fieldIds, size);
}

- (gconstpointer)const:(EContactField)fieldId
{
	return e_contact_get_const([self CONTACT], fieldId);
}

- (bool)inlineLocalPhotos:(GError**)err
{
	return e_contact_inline_local_photos([self CONTACT], err);
}

- (void)setWithFieldId:(EContactField)fieldId value:(gconstpointer)value
{
	e_contact_set([self CONTACT], fieldId, value);
}

- (void)setAttributesWithFieldId:(EContactField)fieldId attributes:(GList*)attributes
{
	e_contact_set_attributes([self CONTACT], fieldId, attributes);
}


@end