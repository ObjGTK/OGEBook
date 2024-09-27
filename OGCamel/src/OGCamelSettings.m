/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSettings.h"

@implementation OGCamelSettings

- (CamelSettings*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSettings, CamelSettings);
}

- (OGCamelSettings*)clone
{
	CamelSettings* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_settings_clone([self castedGObject]), CamelSettings, CamelSettings);

	OGCamelSettings* returnValue = [OGCamelSettings withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)equal:(OGCamelSettings*)settingsB
{
	bool returnValue = camel_settings_equal([self castedGObject], [settingsB castedGObject]);

	return returnValue;
}


@end