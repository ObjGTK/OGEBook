/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceBackend.h"

@implementation OGESourceBackend

- (ESourceBackend*)castedGObject
{
	return E_SOURCE_BACKEND([self gObject]);
}

- (OFString*)dupBackendName
{
	gchar* gobjectValue = e_source_backend_dup_backend_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)backendName
{
	const gchar* gobjectValue = e_source_backend_get_backend_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setBackendName:(OFString*)backendName
{
	e_source_backend_set_backend_name([self castedGObject], [backendName UTF8String]);
}


@end