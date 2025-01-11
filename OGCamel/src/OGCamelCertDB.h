/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelCertDB : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * FIXME Document me!
 *
 * @return
 */
+ (OGCamelCertDB*)default;

/**
 * Constructors
 */
+ (instancetype)certDB;

/**
 * Methods
 */

- (CamelCertDB*)castedGObject;

/**
 *
 */
- (void)clear;

/**
 *
 * @param hostname a host name of a certificate
 * @param fingerprint a fingerprint of a certificate
 * @return a #CamelCert corresponding to the pair of @hostname
 *   and @fingerprint, or %NULL, if no such certificate is stored in the @certdb.
 */
- (CamelCert*)hostWithHostname:(OFString*)hostname fingerprint:(OFString*)fingerprint;

/**
 * Gathers a list of known certificates. Each certificate in the returned #GSList
 * is referenced, thus unref it with camel_cert_unref() when done with it, the same
 * as free the list itself.
 *
 * @return Newly allocated list of
 *   referenced CamelCert-s, which are stored in the @certdb.
 */
- (GSList*)listCerts;

/**
 *
 * @return
 */
- (gint)load;

/**
 * Puts a certificate to the database. In case there exists a certificate
 * with the same hostname and fingerprint, then it is replaced. This adds
 * its own reference on the @cert.
 *
 * @param cert a #CamelCert
 */
- (void)put:(CamelCert*)cert;

/**
 * Removes a certificate identified by the @hostname and @fingerprint.
 *
 * @param hostname a host name of a certificate
 * @param fingerprint a fingerprint of a certificate
 */
- (void)removeHostWithHostname:(OFString*)hostname fingerprint:(OFString*)fingerprint;

/**
 *
 * @return
 */
- (gint)save;

/**
 *
 */
- (void)setDefault;

/**
 *
 * @param filename
 */
- (void)setFilename:(OFString*)filename;

/**
 *
 */
- (void)touch;

@end