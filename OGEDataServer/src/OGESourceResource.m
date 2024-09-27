/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceResource.h"

@implementation OGESourceResource

- (ESourceResource*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceResource, ESourceResource);
}

- (OFString*)dupIdentity
{
	gchar* gobjectValue = e_source_resource_dup_identity([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)identity
{
	const gchar* gobjectValue = e_source_resource_get_identity([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setIdentity:(OFString*)identity
{
	e_source_resource_set_identity([self castedGObject], [identity UTF8String]);
}


@end