/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEVCard.h"

@implementation OGEVCard

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_VCARD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OFString*)escapeString:(OFString*)s
{
	gchar* gobjectValue = e_vcard_escape_string([s UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

+ (OFString*)unescapeString:(OFString*)s
{
	gchar* gobjectValue = e_vcard_unescape_string([s UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

+ (instancetype)vCard
{
	EVCard* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_vcard_new(), EVCard, EVCard);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGEVCard* wrapperObject;
	@try {
		wrapperObject = [[OGEVCard alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)vCardFromString:(OFString*)str
{
	EVCard* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_vcard_new_from_string([str UTF8String]), EVCard, EVCard);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGEVCard* wrapperObject;
	@try {
		wrapperObject = [[OGEVCard alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (EVCard*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EVCard, EVCard);
}

- (void)addAttribute:(EVCardAttribute*)attr
{
	e_vcard_add_attribute([self castedGObject], attr);
}

- (void)addAttributeWithValue:(EVCardAttribute*)attr value:(OFString*)value
{
	e_vcard_add_attribute_with_value([self castedGObject], attr, [value UTF8String]);
}

- (void)appendAttribute:(EVCardAttribute*)attr
{
	e_vcard_append_attribute([self castedGObject], attr);
}

- (void)appendAttributeWithValue:(EVCardAttribute*)attr value:(OFString*)value
{
	e_vcard_append_attribute_with_value([self castedGObject], attr, [value UTF8String]);
}

- (void)construct:(OFString*)str
{
	e_vcard_construct([self castedGObject], [str UTF8String]);
}

- (void)constructFull:(OFString*)str len:(gssize)len uid:(OFString*)uid
{
	e_vcard_construct_full([self castedGObject], [str UTF8String], len, [uid UTF8String]);
}

- (void)constructWithUid:(OFString*)str uid:(OFString*)uid
{
	e_vcard_construct_with_uid([self castedGObject], [str UTF8String], [uid UTF8String]);
}

- (void)dumpStructure
{
	e_vcard_dump_structure([self castedGObject]);
}

- (EVCardAttribute*)attributeWithName:(OFString*)name
{
	EVCardAttribute* returnValue = (EVCardAttribute*)e_vcard_get_attribute([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (EVCardAttribute*)attributeIfParsedWithName:(OFString*)name
{
	EVCardAttribute* returnValue = (EVCardAttribute*)e_vcard_get_attribute_if_parsed([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (GList*)attributes
{
	GList* returnValue = (GList*)e_vcard_get_attributes([self castedGObject]);

	return returnValue;
}

- (bool)isParsed
{
	bool returnValue = (bool)e_vcard_is_parsed([self castedGObject]);

	return returnValue;
}

- (void)removeAttribute:(EVCardAttribute*)attr
{
	e_vcard_remove_attribute([self castedGObject], attr);
}

- (void)removeAttributesWithAttrGroup:(OFString*)attrGroup attrName:(OFString*)attrName
{
	e_vcard_remove_attributes([self castedGObject], [attrGroup UTF8String], [attrName UTF8String]);
}

- (OFString*)toStringWithFormat:(EVCardFormat)format
{
	gchar* gobjectValue = e_vcard_to_string([self castedGObject], format);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)utilDupXattributeWithXname:(OFString*)xname
{
	gchar* gobjectValue = e_vcard_util_dup_x_attribute([self castedGObject], [xname UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)utilSetXattributeWithXname:(OFString*)xname value:(OFString*)value
{
	e_vcard_util_set_x_attribute([self castedGObject], [xname UTF8String], [value UTF8String]);
}


@end