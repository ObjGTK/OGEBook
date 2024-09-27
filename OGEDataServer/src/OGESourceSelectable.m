/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceSelectable.h"

@implementation OGESourceSelectable

- (ESourceSelectable*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceSelectable, ESourceSelectable);
}

- (OFString*)dupColor
{
	gchar* gobjectValue = e_source_selectable_dup_color([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)color
{
	const gchar* gobjectValue = e_source_selectable_get_color([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint)order
{
	guint returnValue = e_source_selectable_get_order([self castedGObject]);

	return returnValue;
}

- (bool)selected
{
	bool returnValue = e_source_selectable_get_selected([self castedGObject]);

	return returnValue;
}

- (void)setColor:(OFString*)color
{
	e_source_selectable_set_color([self castedGObject], [color UTF8String]);
}

- (void)setOrder:(guint)order
{
	e_source_selectable_set_order([self castedGObject], order);
}

- (void)setSelected:(bool)selected
{
	e_source_selectable_set_selected([self castedGObject], selected);
}


@end