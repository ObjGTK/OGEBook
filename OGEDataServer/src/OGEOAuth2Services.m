/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEOAuth2Services.h"

#import "OGESource.h"

@implementation OGEOAuth2Services

+ (bool)isOauth2AliasStatic:(OFString*)authMethod
{
	bool returnValue = e_oauth2_services_is_oauth2_alias_static([authMethod UTF8String]);

	return returnValue;
}

+ (bool)isSupported
{
	bool returnValue = e_oauth2_services_is_supported();

	return returnValue;
}

- (instancetype)init
{
	EOAuth2Services* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_oauth2_services_new(), EOAuth2Services, EOAuth2Services);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (EOAuth2Services*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EOAuth2Services, EOAuth2Services);
}

- (void)add:(EOAuth2Service*)service
{
	e_oauth2_services_add([self castedGObject], service);
}

- (EOAuth2Service*)find:(OGESource*)source
{
	EOAuth2Service* returnValue = e_oauth2_services_find([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (EOAuth2Service*)guessWithProtocol:(OFString*)protocol hostname:(OFString*)hostname
{
	EOAuth2Service* returnValue = e_oauth2_services_guess([self castedGObject], [protocol UTF8String], [hostname UTF8String]);

	return returnValue;
}

- (bool)isOauth2Alias:(OFString*)authMethod
{
	bool returnValue = e_oauth2_services_is_oauth2_alias([self castedGObject], [authMethod UTF8String]);

	return returnValue;
}

- (GSList*)list
{
	GSList* returnValue = e_oauth2_services_list([self castedGObject]);

	return returnValue;
}

- (void)remove:(EOAuth2Service*)service
{
	e_oauth2_services_remove([self castedGObject], service);
}


@end