/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceSelectable.h"

@implementation OGESourceSelectable

- (ESourceSelectable*)SOURCESELECTABLE
{
	return E_SOURCE_SELECTABLE([self GOBJECT]);
}

- (OFString*)dupColor
{
	return [OFString stringWithUTF8String:e_source_selectable_dup_color([self SOURCESELECTABLE])];
}

- (OFString*)color
{
	return [OFString stringWithUTF8String:e_source_selectable_get_color([self SOURCESELECTABLE])];
}

- (bool)selected
{
	return e_source_selectable_get_selected([self SOURCESELECTABLE]);
}

- (void)setColor:(OFString*)color
{
	e_source_selectable_set_color([self SOURCESELECTABLE], [color UTF8String]);
}

- (void)setSelected:(bool)selected
{
	e_source_selectable_set_selected([self SOURCESELECTABLE], selected);
}


@end