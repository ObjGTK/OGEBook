/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEOAuth2Services.h"

#import "OGESource.h"

@implementation OGEOAuth2Services

+ (bool)isOauth2AliasStatic:(OFString*)authMethod
{
	return e_oauth2_services_is_oauth2_alias_static([authMethod UTF8String]);
}

+ (bool)isSupported
{
	return e_oauth2_services_is_supported();
}

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)e_oauth2_services_new()];

	return self;
}

- (EOAuth2Services*)OAUTH2SERVICES
{
	return E_OAUTH2_SERVICES([self GOBJECT]);
}

- (void)add:(EOAuth2Service*)service
{
	e_oauth2_services_add([self OAUTH2SERVICES], service);
}

- (EOAuth2Service*)find:(OGESource*)source
{
	return e_oauth2_services_find([self OAUTH2SERVICES], [source SOURCE]);
}

- (EOAuth2Service*)guessWithProtocol:(OFString*)protocol hostname:(OFString*)hostname
{
	return e_oauth2_services_guess([self OAUTH2SERVICES], [protocol UTF8String], [hostname UTF8String]);
}

- (bool)isOauth2Alias:(OFString*)authMethod
{
	return e_oauth2_services_is_oauth2_alias([self OAUTH2SERVICES], [authMethod UTF8String]);
}

- (GSList*)list
{
	return e_oauth2_services_list([self OAUTH2SERVICES]);
}

- (void)remove:(EOAuth2Service*)service
{
	e_oauth2_services_remove([self OAUTH2SERVICES], service);
}


@end