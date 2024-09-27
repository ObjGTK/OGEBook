/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAutocomplete.h"

@implementation OGESourceAutocomplete

- (ESourceAutocomplete*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceAutocomplete, ESourceAutocomplete);
}

- (bool)includeMe
{
	bool returnValue = e_source_autocomplete_get_include_me([self castedGObject]);

	return returnValue;
}

- (void)setIncludeMe:(bool)includeMe
{
	e_source_autocomplete_set_include_me([self castedGObject], includeMe);
}


@end