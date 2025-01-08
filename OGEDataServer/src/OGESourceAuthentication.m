/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAuthentication.h"

@implementation OGESourceAuthentication

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_AUTHENTICATION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceAuthentication*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceAuthentication, ESourceAuthentication);
}

- (OFString*)dupCredentialName
{
	gchar* gobjectValue = e_source_authentication_dup_credential_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupHost
{
	gchar* gobjectValue = e_source_authentication_dup_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupMethod
{
	gchar* gobjectValue = e_source_authentication_dup_method([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupProxyUid
{
	gchar* gobjectValue = e_source_authentication_dup_proxy_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupUser
{
	gchar* gobjectValue = e_source_authentication_dup_user([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)credentialName
{
	const gchar* gobjectValue = e_source_authentication_get_credential_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)host
{
	const gchar* gobjectValue = e_source_authentication_get_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isExternal
{
	bool returnValue = (bool)e_source_authentication_get_is_external([self castedGObject]);

	return returnValue;
}

- (OFString*)method
{
	const gchar* gobjectValue = e_source_authentication_get_method([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint16)port
{
	guint16 returnValue = (guint16)e_source_authentication_get_port([self castedGObject]);

	return returnValue;
}

- (OFString*)proxyUid
{
	const gchar* gobjectValue = e_source_authentication_get_proxy_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)rememberPassword
{
	bool returnValue = (bool)e_source_authentication_get_remember_password([self castedGObject]);

	return returnValue;
}

- (OFString*)user
{
	const gchar* gobjectValue = e_source_authentication_get_user([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GSocketConnectable*)refConnectable
{
	GSocketConnectable* returnValue = (GSocketConnectable*)e_source_authentication_ref_connectable([self castedGObject]);

	return returnValue;
}

- (bool)required
{
	bool returnValue = (bool)e_source_authentication_required([self castedGObject]);

	return returnValue;
}

- (void)setCredentialName:(OFString*)credentialName
{
	e_source_authentication_set_credential_name([self castedGObject], [credentialName UTF8String]);
}

- (void)setHost:(OFString*)host
{
	e_source_authentication_set_host([self castedGObject], [host UTF8String]);
}

- (void)setIsExternal:(bool)isExternal
{
	e_source_authentication_set_is_external([self castedGObject], isExternal);
}

- (void)setMethod:(OFString*)method
{
	e_source_authentication_set_method([self castedGObject], [method UTF8String]);
}

- (void)setPort:(guint16)port
{
	e_source_authentication_set_port([self castedGObject], port);
}

- (void)setProxyUid:(OFString*)proxyUid
{
	e_source_authentication_set_proxy_uid([self castedGObject], [proxyUid UTF8String]);
}

- (void)setRememberPassword:(bool)rememberPassword
{
	e_source_authentication_set_remember_password([self castedGObject], rememberPassword);
}

- (void)setUser:(OFString*)user
{
	e_source_authentication_set_user([self castedGObject], [user UTF8String]);
}


@end