/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceRevisionGuards.h"

@implementation OGESourceRevisionGuards

- (ESourceRevisionGuards*)SOURCEREVISIONGUARDS
{
	return E_SOURCE_REVISION_GUARDS([self GOBJECT]);
}

- (bool)enabled
{
	return e_source_revision_guards_get_enabled([self SOURCEREVISIONGUARDS]);
}

- (void)setEnabled:(bool)enabled
{
	e_source_revision_guards_set_enabled([self SOURCEREVISIONGUARDS], enabled);
}


@end