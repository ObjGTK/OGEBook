/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceSMIME : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceSMIME*)SOURCESMIME;

/**
 * Thread-safe variation of e_source_smime_get_encryption_certificate().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceSMIME:encryption-certificate
 */
- (OFString*)dupEncryptionCertificate;

/**
 * Thread-safe variation of e_source_smime_get_signing_algorithm().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceSMIME:signing-algorithm
 */
- (OFString*)dupSigningAlgorithm;

/**
 * Thread-safe variation of e_source_smime_get_signing_certificate().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceSMIME:signing-certificate
 */
- (OFString*)dupSigningCertificate;

/**
 * Returns whether to encrypt outgoing messages by default using S/MIME
 * software such as Mozilla Network Security Services (NSS).
 *
 * @return whether to encrypt outgoing messages by default
 */
- (bool)encryptByDefault;

/**
 * Returns whether to "encrypt-to-self" when sending encrypted messages.
 *
 * @return whether to "encrypt-to-self"
 */
- (bool)encryptToSelf;

/**
 * Returns the S/MIME certificate name used to encrypt messages.
 *
 * @return the certificate name used to encrypt messages
 */
- (OFString*)encryptionCertificate;

/**
 * Returns whether to digitally sign outgoing messages by default using
 * S/MIME software such as Mozilla Network Security Services (NSS).
 *
 * @return whether to sign outgoing messages by default
 */
- (bool)signByDefault;

/**
 * Returns the name of the hash algorithm used to digitally sign outgoing
 * messages.
 *
 * @return the signing algorithm for outgoing messages
 */
- (OFString*)signingAlgorithm;

/**
 * Returns the S/MIME certificate name used to sign messages.
 *
 * @return the certificate name used to sign messages
 */
- (OFString*)signingCertificate;

/**
 * Sets whether to encrypt outgoing messages by default using S/MIME
 * software such as Mozilla Network Security Services (NSS).
 *
 * @param encryptByDefault whether to encrypt outgoing messages by default
 */
- (void)setEncryptByDefault:(bool)encryptByDefault;

/**
 * Sets whether to "encrypt-to-self" when sending encrypted messages.
 *
 * @param encryptToSelf whether to "encrypt-to-self"
 */
- (void)setEncryptToSelf:(bool)encryptToSelf;

/**
 * Sets the certificate name used to encrypt messages.
 * 
 * If the @encryption_certificate string is empty, %NULL is set instead.
 *
 * @param encryptionCertificate the certificate name used to encrypt
 *                          messages, or %NULL
 */
- (void)setEncryptionCertificate:(OFString*)encryptionCertificate;

/**
 * Sets whether to digitally sign outgoing messages by default using
 * S/MIME software such as Mozilla Network Security Services (NSS).
 *
 * @param signByDefault whether to sign outgoing messages by default
 */
- (void)setSignByDefault:(bool)signByDefault;

/**
 * Sets the name of the hash algorithm used to digitally sign outgoing
 * messages.
 * 
 * The internal copy of @signing_algorithm is automatically stripped of
 * leading and trailing whitespace.  If the resulting string is empty,
 * %NULL is set instead.
 *
 * @param signingAlgorithm the signing algorithm for outgoing
 *                     messages, or %NULL
 */
- (void)setSigningAlgorithm:(OFString*)signingAlgorithm;

/**
 * Sets the S/MIME certificate name used to sign messages.
 * 
 * If the @signing_certificate string is empty, %NULL is set instead.
 *
 * @param signingCertificate the certificate name used to sign
 *                       messages, or %NULL
 */
- (void)setSigningCertificate:(OFString*)signingCertificate;

@end