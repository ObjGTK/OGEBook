/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRevisionGuards.h"

@implementation OGESourceRevisionGuards

- (ESourceRevisionGuards*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceRevisionGuards, ESourceRevisionGuards);
}

- (bool)enabled
{
	bool returnValue = e_source_revision_guards_get_enabled([self castedGObject]);

	return returnValue;
}

- (void)setEnabled:(bool)enabled
{
	e_source_revision_guards_set_enabled([self castedGObject], enabled);
}


@end