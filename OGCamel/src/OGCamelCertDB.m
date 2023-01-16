/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelCertDB.h"

@implementation OGCamelCertDB

+ (OGCamelCertDB*)default
{
	return [[[OGCamelCertDB alloc] initWithGObject:(GObject*)camel_certdb_get_default()] autorelease];
}

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_certdb_new()];

	return self;
}

- (CamelCertDB*)CERTDB
{
	return CAMEL_CERTDB([self GOBJECT]);
}

- (void)clear
{
	camel_certdb_clear([self CERTDB]);
}

- (CamelCert*)hostWithHostname:(OFString*)hostname fingerprint:(OFString*)fingerprint
{
	return camel_certdb_get_host([self CERTDB], [hostname UTF8String], [fingerprint UTF8String]);
}

- (GSList*)listCerts
{
	return camel_certdb_list_certs([self CERTDB]);
}

- (gint)load
{
	return camel_certdb_load([self CERTDB]);
}

- (void)put:(CamelCert*)cert
{
	camel_certdb_put([self CERTDB], cert);
}

- (void)removeHostWithHostname:(OFString*)hostname fingerprint:(OFString*)fingerprint
{
	camel_certdb_remove_host([self CERTDB], [hostname UTF8String], [fingerprint UTF8String]);
}

- (gint)save
{
	return camel_certdb_save([self CERTDB]);
}

- (void)setDefault
{
	camel_certdb_set_default([self CERTDB]);
}

- (void)setFilename:(OFString*)filename
{
	camel_certdb_set_filename([self CERTDB], [filename UTF8String]);
}

- (void)touch
{
	camel_certdb_touch([self CERTDB]);
}


@end