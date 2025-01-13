/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSettings.h"

@implementation OGCamelSettings

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_SETTINGS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelSettings*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSettings, CamelSettings);
}

- (OGCamelSettings*)clone
{
	CamelSettings* gobjectValue = camel_settings_clone([self castedGObject]);

	OGCamelSettings* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)equalWithSettingsB:(OGCamelSettings*)settingsB
{
	bool returnValue = (bool)camel_settings_equal([self castedGObject], [settingsB castedGObject]);

	return returnValue;
}


@end