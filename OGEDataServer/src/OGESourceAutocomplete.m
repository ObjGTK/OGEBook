/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAutocomplete.h"

@implementation OGESourceAutocomplete

- (ESourceAutocomplete*)SOURCEAUTOCOMPLETE
{
	return E_SOURCE_AUTOCOMPLETE([self GOBJECT]);
}

- (bool)includeMe
{
	return e_source_autocomplete_get_include_me([self SOURCEAUTOCOMPLETE]);
}

- (void)setIncludeMe:(bool)includeMe
{
	e_source_autocomplete_set_include_me([self SOURCEAUTOCOMPLETE], includeMe);
}


@end