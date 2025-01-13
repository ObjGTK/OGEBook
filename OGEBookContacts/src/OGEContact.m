/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEContact.h"

@implementation OGEContact

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_CONTACT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (EContactField)fieldIdWithFieldName:(OFString*)fieldName
{
	EContactField returnValue = (EContactField)e_contact_field_id([fieldName UTF8String]);

	return returnValue;
}

+ (EContactField)fieldIdFromVcardWithVcardField:(OFString*)vcardField
{
	EContactField returnValue = (EContactField)e_contact_field_id_from_vcard([vcardField UTF8String]);

	return returnValue;
}

+ (bool)fieldIsStringWithFieldId:(EContactField)fieldId
{
	bool returnValue = (bool)e_contact_field_is_string(fieldId);

	return returnValue;
}

+ (OFString*)fieldNameWithFieldId:(EContactField)fieldId
{
	const gchar* gobjectValue = e_contact_field_name(fieldId);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (GType)fieldTypeWithFieldId:(EContactField)fieldId
{
	GType returnValue = (GType)e_contact_field_type(fieldId);

	return returnValue;
}

+ (OFString*)prettyNameWithFieldId:(EContactField)fieldId
{
	const gchar* gobjectValue = e_contact_pretty_name(fieldId);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (OFString*)vcardAttributeWithFieldId:(EContactField)fieldId
{
	const gchar* gobjectValue = e_contact_vcard_attribute(fieldId);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (instancetype)contact
{
	EContact* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_contact_new(), EContact, EContact);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGEContact* wrapperObject;
	@try {
		wrapperObject = [[OGEContact alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)contactFromVcard:(OFString*)vcard
{
	EContact* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_contact_new_from_vcard([vcard UTF8String]), EContact, EContact);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGEContact* wrapperObject;
	@try {
		wrapperObject = [[OGEContact alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)contactFromVcardWithUid:(OFString*)vcard uid:(OFString*)uid
{
	EContact* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_contact_new_from_vcard_with_uid([vcard UTF8String], [uid UTF8String]), EContact, EContact);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGEContact* wrapperObject;
	@try {
		wrapperObject = [[OGEContact alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (EContact*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EContact, EContact);
}

- (OGEContact*)duplicate
{
	EContact* gobjectValue = e_contact_duplicate([self castedGObject]);

	OGEContact* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (gpointer)getWithFieldId:(EContactField)fieldId
{
	gpointer returnValue = (gpointer)e_contact_get([self castedGObject], fieldId);

	return returnValue;
}

- (GList*)attributesWithFieldId:(EContactField)fieldId
{
	GList* returnValue = (GList*)e_contact_get_attributes([self castedGObject], fieldId);

	return returnValue;
}

- (GList*)attributesSetWithFieldIds:(const EContactField*)fieldIds size:(gint)size
{
	GList* returnValue = (GList*)e_contact_get_attributes_set([self castedGObject], fieldIds, size);

	return returnValue;
}

- (gconstpointer)constWithFieldId:(EContactField)fieldId
{
	gconstpointer returnValue = (gconstpointer)e_contact_get_const([self castedGObject], fieldId);

	return returnValue;
}

- (bool)inlineLocalPhotos
{
	GError* err = NULL;

	bool returnValue = (bool)e_contact_inline_local_photos([self castedGObject], &err);

	[OGErrorException throwForError:err];

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