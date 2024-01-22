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
	return E_SOURCE_EXTENSION([self gObject]);
}

- (OGESource*)source
{
	ESource* gobjectValue = E_SOURCE(e_source_extension_get_source([self castedGObject]));

	OGESource* returnValue = [OGESource wrapperFor:gobjectValue];
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
	ESource* gobjectValue = E_SOURCE(e_source_extension_ref_source([self castedGObject]));

	OGESource* returnValue = [OGESource wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}


@end