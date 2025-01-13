/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelCertDB.h"

@implementation OGCamelCertDB

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_CERTDB;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGCamelCertDB*)default
{
	CamelCertDB* gobjectValue = camel_certdb_get_default();

	OGCamelCertDB* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (instancetype)certDB
{
	CamelCertDB* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_certdb_new(), CamelCertDB, CamelCertDB);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelCertDB* wrapperObject;
	@try {
		wrapperObject = [[OGCamelCertDB alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelCertDB*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelCertDB, CamelCertDB);
}

- (void)clear
{
	camel_certdb_clear([self castedGObject]);
}

- (CamelCert*)hostWithHostname:(OFString*)hostname fingerprint:(OFString*)fingerprint
{
	CamelCert* returnValue = (CamelCert*)camel_certdb_get_host([self castedGObject], [hostname UTF8String], [fingerprint UTF8String]);

	return returnValue;
}

- (GSList*)listCerts
{
	GSList* returnValue = (GSList*)camel_certdb_list_certs([self castedGObject]);

	return returnValue;
}

- (gint)load
{
	gint returnValue = (gint)camel_certdb_load([self castedGObject]);

	return returnValue;
}

- (void)putWithCert:(CamelCert*)cert
{
	camel_certdb_put([self castedGObject], cert);
}

- (void)removeHostWithHostname:(OFString*)hostname fingerprint:(OFString*)fingerprint
{
	camel_certdb_remove_host([self castedGObject], [hostname UTF8String], [fingerprint UTF8String]);
}

- (gint)save
{
	gint returnValue = (gint)camel_certdb_save([self castedGObject]);

	return returnValue;
}

- (void)setDefault
{
	camel_certdb_set_default([self castedGObject]);
}

- (void)setFilename:(OFString*)filename
{
	camel_certdb_set_filename([self castedGObject], [filename UTF8String]);
}

- (void)touch
{
	camel_certdb_touch([self castedGObject]);
}


@end