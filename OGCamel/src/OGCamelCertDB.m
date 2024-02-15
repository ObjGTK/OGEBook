/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelCertDB.h"

@implementation OGCamelCertDB

+ (OGCamelCertDB*)default
{
	CamelCertDB* gobjectValue = CAMEL_CERTDB(camel_certdb_get_default());

	OGCamelCertDB* returnValue = [OGCamelCertDB withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (instancetype)init
{
	CamelCertDB* gobjectValue = CAMEL_CERTDB(camel_certdb_new());

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

- (CamelCertDB*)castedGObject
{
	return CAMEL_CERTDB([self gObject]);
}

- (void)clear
{
	camel_certdb_clear([self castedGObject]);
}

- (CamelCert*)hostWithHostname:(OFString*)hostname fingerprint:(OFString*)fingerprint
{
	CamelCert* returnValue = camel_certdb_get_host([self castedGObject], [hostname UTF8String], [fingerprint UTF8String]);

	return returnValue;
}

- (GSList*)listCerts
{
	GSList* returnValue = camel_certdb_list_certs([self castedGObject]);

	return returnValue;
}

- (gint)load
{
	gint returnValue = camel_certdb_load([self castedGObject]);

	return returnValue;
}

- (void)put:(CamelCert*)cert
{
	camel_certdb_put([self castedGObject], cert);
}

- (void)removeHostWithHostname:(OFString*)hostname fingerprint:(OFString*)fingerprint
{
	camel_certdb_remove_host([self castedGObject], [hostname UTF8String], [fingerprint UTF8String]);
}

- (gint)save
{
	gint returnValue = camel_certdb_save([self castedGObject]);

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