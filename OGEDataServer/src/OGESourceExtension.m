/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

#import "OGESource.h"

@implementation OGESourceExtension

- (ESourceExtension*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceExtension, ESourceExtension);
}

- (OGESource*)source
{
	ESource* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_source_extension_get_source([self castedGObject]), ESource, ESource);

	OGESource* returnValue = [OGESource withGObject:gobjectValue];
	return returnValue;
}

- (void)propertyLock
{
	e_source_extension_property_lock([self castedGObject]);
}

- (void)propertyUnlock
{
	e_source_extension_property_unlock([self castedGObject]);
}

- (OGESource*)refSource
{
	ESource* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_source_extension_ref_source([self castedGObject]), ESource, ESource);

	OGESource* returnValue = [OGESource withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}


@end