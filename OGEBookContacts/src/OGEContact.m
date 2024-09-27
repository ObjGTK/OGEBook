/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEContact.h"

@implementation OGEContact

+ (EContactField)fieldId:(OFString*)fieldName
{
	EContactField returnValue = e_contact_field_id([fieldName UTF8String]);

	return returnValue;
}

+ (EContactField)fieldIdFromVcard:(OFString*)vcardField
{
	EContactField returnValue = e_contact_field_id_from_vcard([vcardField UTF8String]);

	return returnValue;
}

+ (bool)fieldIsString:(EContactField)fieldId
{
	bool returnValue = e_contact_field_is_string(fieldId);

	return returnValue;
}

+ (OFString*)fieldName:(EContactField)fieldId
{
	const gchar* gobjectValue = e_contact_field_name(fieldId);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (GType)fieldType:(EContactField)fieldId
{
	GType returnValue = e_contact_field_type(fieldId);

	return returnValue;
}

+ (OFString*)prettyName:(EContactField)fieldId
{
	const gchar* gobjectValue = e_contact_pretty_name(fieldId);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (OFString*)vcardAttribute:(EContactField)fieldId
{
	const gchar* gobjectValue = e_contact_vcard_attribute(fieldId);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (instancetype)init
{
	EContact* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_contact_new(), EContact, EContact);

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

- (instancetype)initFromVcard:(OFString*)vcard
{
	EContact* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_contact_new_from_vcard([vcard UTF8String]), EContact, EContact);

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

- (instancetype)initFromVcardWithUidWithVcard:(OFString*)vcard uid:(OFString*)uid
{
	EContact* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_contact_new_from_vcard_with_uid([vcard UTF8String], [uid UTF8String]), EContact, EContact);

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

- (EContact*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EContact, EContact);
}

- (OGEContact*)duplicate
{
	EContact* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_contact_duplicate([self castedGObject]), EContact, EContact);

	OGEContact* returnValue = [OGEContact withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (gpointer)get:(EContactField)fieldId
{
	gpointer returnValue = e_contact_get([self castedGObject], fieldId);

	return returnValue;
}

- (GList*)attributes:(EContactField)fieldId
{
	GList* returnValue = e_contact_get_attributes([self castedGObject], fieldId);

	return returnValue;
}

- (GList*)attributesSetWithFieldIds:(const EContactField*)fieldIds size:(gint)size
{
	GList* returnValue = e_contact_get_attributes_set([self castedGObject], fieldIds, size);

	return returnValue;
}

- (gconstpointer)const:(EContactField)fieldId
{
	gconstpointer returnValue = e_contact_get_const([self castedGObject], fieldId);

	return returnValue;
}

- (bool)inlineLocalPhotos
{
	GError* err = NULL;

	bool returnValue = e_contact_inline_local_photos([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setWithFieldId:(EContactField)fieldId value:(gconstpointer)value
{
	e_contact_set([self castedGObject], fieldId, value);
}

- (void)setAttributesWithFieldId:(EContactField)fieldId attributes:(GList*)attributes
{
	e_contact_set_attributes([self castedGObject], fieldId, attributes);
}


@end