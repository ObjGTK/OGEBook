/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSettings.h"

@implementation OGCamelSettings

- (CamelSettings*)castedGObject
{
	return CAMEL_SETTINGS([self gObject]);
}

- (OGCamelSettings*)clone
{
	CamelSettings* gobjectValue = CAMEL_SETTINGS(camel_settings_clone([self castedGObject]));

	OGCamelSettings* returnValue = [OGCamelSettings wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)equal:(OGCamelSettings*)settingsB
{
	bool returnValue = camel_settings_equal([self castedGObject], [settingsB castedGObject]);

	return returnValue;
}


@end