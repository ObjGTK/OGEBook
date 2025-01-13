/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEOAuth2Services.h"

#import "OGESource.h"

@implementation OGEOAuth2Services

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_OAUTH2_SERVICES;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (bool)isOauth2AliasStaticWithAuthMethod:(OFString*)authMethod
{
	bool returnValue = (bool)e_oauth2_services_is_oauth2_alias_static([authMethod UTF8String]);

	return returnValue;
}

+ (bool)isSupported
{
	bool returnValue = (bool)e_oauth2_services_is_supported();

	return returnValue;
}

+ (instancetype)oAuth2Services
{
	EOAuth2Services* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_oauth2_services_new(), EOAuth2Services, EOAuth2Services);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGEOAuth2Services* wrapperObject;
	@try {
		wrapperObject = [[OGEOAuth2Services alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (EOAuth2Services*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EOAuth2Services, EOAuth2Services);
}

- (void)addWithService:(EOAuth2Service*)service
{
	e_oauth2_services_add([self castedGObject], service);
}

- (EOAuth2Service*)findWithSource:(OGESource*)source
{
	EOAuth2Service* returnValue = (EOAuth2Service*)e_oauth2_services_find([self castedGObject], [source castedGObject]);

	return returnValue;
}

- (EOAuth2Service*)guessWithProtocol:(OFString*)protocol hostname:(OFString*)hostname
{
	EOAuth2Service* returnValue = (EOAuth2Service*)e_oauth2_services_guess([self castedGObject], [protocol UTF8String], [hostname UTF8String]);

	return returnValue;
}

- (bool)isOauth2AliasWithAuthMethod:(OFString*)authMethod
{
	bool returnValue = (bool)e_oauth2_services_is_oauth2_alias([self castedGObject], [authMethod UTF8String]);

	return returnValue;
}

- (GSList*)list
{
	GSList* returnValue = (GSList*)e_oauth2_services_list([self castedGObject]);

	return returnValue;
}

- (void)removeWithService:(EOAuth2Service*)service
{
	e_oauth2_services_remove([self castedGObject], service);
}


@end