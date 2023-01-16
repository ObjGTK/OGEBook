/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceSecurity.h"

@implementation OGESourceSecurity

- (ESourceSecurity*)SOURCESECURITY
{
	return E_SOURCE_SECURITY([self GOBJECT]);
}

- (OFString*)dupMethod
{
	return [OFString stringWithUTF8String:e_source_security_dup_method([self SOURCESECURITY])];
}

- (OFString*)method
{
	return [OFString stringWithUTF8String:e_source_security_get_method([self SOURCESECURITY])];
}

- (bool)secure
{
	return e_source_security_get_secure([self SOURCESECURITY]);
}

- (void)setMethod:(OFString*)method
{
	e_source_security_set_method([self SOURCESECURITY], [method UTF8String]);
}

- (void)setSecure:(bool)secure
{
	e_source_security_set_secure([self SOURCESECURITY], secure);
}


@end