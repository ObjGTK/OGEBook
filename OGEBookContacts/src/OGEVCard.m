/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEVCard.h"

@implementation OGEVCard

+ (OFString*)escapeString:(OFString*)s
{
	return [OFString stringWithUTF8String:e_vcard_escape_string([s UTF8String])];
}

+ (OFString*)unescapeString:(OFString*)s
{
	return [OFString stringWithUTF8String:e_vcard_unescape_string([s UTF8String])];
}

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)e_vcard_new()];

	return self;
}

- (instancetype)initFromString:(OFString*)str
{
	self = [super initWithGObject:(GObject*)e_vcard_new_from_string([str UTF8String])];

	return self;
}

- (EVCard*)VCARD
{
	return E_VCARD([self GOBJECT]);
}

- (void)addAttribute:(EVCardAttribute*)attr
{
	e_vcard_add_attribute([self VCARD], attr);
}

- (void)addAttributeWithValueWithAttr:(EVCardAttribute*)attr value:(OFString*)value
{
	e_vcard_add_attribute_with_value([self VCARD], attr, [value UTF8String]);
}

- (void)appendAttribute:(EVCardAttribute*)attr
{
	e_vcard_append_attribute([self VCARD], attr);
}

- (void)appendAttributeWithValueWithAttr:(EVCardAttribute*)attr value:(OFString*)value
{
	e_vcard_append_attribute_with_value([self VCARD], attr, [value UTF8String]);
}

- (void)construct:(OFString*)str
{
	e_vcard_construct([self VCARD], [str UTF8String]);
}

- (void)constructFullWithStr:(OFString*)str len:(gssize)len uid:(OFString*)uid
{
	e_vcard_construct_full([self VCARD], [str UTF8String], len, [uid UTF8String]);
}

- (void)constructWithUidWithStr:(OFString*)str uid:(OFString*)uid
{
	e_vcard_construct_with_uid([self VCARD], [str UTF8String], [uid UTF8String]);
}

- (void)dumpStructure
{
	e_vcard_dump_structure([self VCARD]);
}

- (EVCardAttribute*)attribute:(OFString*)name
{
	return e_vcard_get_attribute([self VCARD], [name UTF8String]);
}

- (EVCardAttribute*)attributeIfParsed:(OFString*)name
{
	return e_vcard_get_attribute_if_parsed([self VCARD], [name UTF8String]);
}

- (GList*)attributes
{
	return e_vcard_get_attributes([self VCARD]);
}

- (bool)isParsed
{
	return e_vcard_is_parsed([self VCARD]);
}

- (void)removeAttribute:(EVCardAttribute*)attr
{
	e_vcard_remove_attribute([self VCARD], attr);
}

- (void)removeAttributesWithAttrGroup:(OFString*)attrGroup attrName:(OFString*)attrName
{
	e_vcard_remove_attributes([self VCARD], [attrGroup UTF8String], [attrName UTF8String]);
}

- (OFString*)toString:(EVCardFormat)format
{
	return [OFString stringWithUTF8String:e_vcard_to_string([self VCARD], format)];
}

- (OFString*)utilDupXattribute:(OFString*)xname
{
	return [OFString stringWithUTF8String:e_vcard_util_dup_x_attribute([self VCARD], [xname UTF8String])];
}

- (void)utilSetXattributeWithXname:(OFString*)xname value:(OFString*)value
{
	e_vcard_util_set_x_attribute([self VCARD], [xname UTF8String], [value UTF8String]);
}


@end