/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGCamelMimePart;
@class OGCamelSession;

@interface OGCamelCipherContext : OGObject
{

}

/**
 * Functions
 */

/**
 *
 * @return
 */
+ (GQuark)errorQuark;

/**
 * Constructors
 */
- (instancetype)init:(OGCamelSession*)session;

/**
 * Methods
 */

- (CamelCipherContext*)castedGObject;

/**
 * Asynchronously decrypts @ipart into @opart.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_cipher_context_decrypt_finish() to get the result of
 * the operation.
 *
 * @param ipart cipher-text #CamelMimePart
 * @param opart clear-text #CamelMimePart
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)decryptWithIpart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_cipher_context_decrypt().
 *
 * @param result a #GAsyncResult
 * @return a validity/encryption status, or %NULL on error
 */
- (CamelCipherValidity*)decryptFinish:(GAsyncResult*)result;

/**
 * Decrypts @ipart into @opart.
 *
 * @param ipart cipher-text #CamelMimePart
 * @param opart clear-text #CamelMimePart
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a validity/encryption status, or %NULL on error
 */
- (CamelCipherValidity*)decryptSyncWithIpart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously encrypts the clear-text @ipart and
 * writes the resulting cipher-text to @opart.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_cipher_context_encrypt_finish() to get the result of
 * the operation.
 * 
 * Note: The @userid is unused, %NULL should be passed for it.
 *
 * @param userid unused
 * @param recipients an array of recipient key IDs and/or email addresses
 * @param ipart clear-text #CamelMimePart
 * @param opart cipher-text #CamelMimePart
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)encryptWithUserid:(OFString*)userid recipients:(GPtrArray*)recipients ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_cipher_context_encrypt().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)encryptFinish:(GAsyncResult*)result;

/**
 * Encrypts the clear-text @ipart and writes the resulting cipher-text to @opart.
 * 
 * Note: The @userid is unused, %NULL should be passed for it.
 *
 * @param userid unused
 * @param recipients an array of recipient key IDs and/or email addresses
 * @param ipart clear-text #CamelMimePart
 * @param opart cipher-text #CamelMimePart
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)encryptSyncWithUserid:(OFString*)userid recipients:(GPtrArray*)recipients ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart cancellable:(OGCancellable*)cancellable;

/**
 *
 * @return a #CamelSession the @context had been created with
 */
- (OGCamelSession*)session;

/**
 *
 * @param hash
 * @return
 */
- (OFString*)hashToId:(CamelCipherHash)hash;

/**
 *
 * @param id
 * @return
 */
- (CamelCipherHash)idToHash:(OFString*)id;

/**
 * Asynchronously converts the (unsigned) part @ipart into a new
 * self-contained MIME part @opart.  This may be a multipart/signed part,
 * or a simple part for enveloped types.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_cipher_context_sign_finish() to get the result of the operation.
 *
 * @param userid a private key to use to sign the stream
 * @param hash preferred Message-Integrity-Check hash algorithm
 * @param ipart input #CamelMimePart
 * @param opart output #CamelMimePart
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)signWithUserid:(OFString*)userid hash:(CamelCipherHash)hash ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_cipher_context_sign().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)signFinish:(GAsyncResult*)result;

/**
 * Converts the (unsigned) part @ipart into a new self-contained MIME
 * part @opart.  This may be a multipart/signed part, or a simple part
 * for enveloped types.
 *
 * @param userid a private key to use to sign the stream
 * @param hash preferred Message-Integrity-Check hash algorithm
 * @param ipart input #CamelMimePart
 * @param opart output #CamelMimePart
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)signSyncWithUserid:(OFString*)userid hash:(CamelCipherHash)hash ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously verifies the signature.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_cipher_context_verify_finish() to get the result of
 * the operation.
 *
 * @param ipart the #CamelMimePart to verify
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)verifyWithIpart:(OGCamelMimePart*)ipart ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_cipher_context_verify().
 *
 * @param result a #GAsyncResult
 * @return a #CamelCipherValidity structure containing information
 * about the integrity of the input stream, or %NULL on failure to
 * execute at all
 */
- (CamelCipherValidity*)verifyFinish:(GAsyncResult*)result;

/**
 * Verifies the signature.
 *
 * @param ipart the #CamelMimePart to verify
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a #CamelCipherValidity structure containing information
 * about the integrity of the input stream, or %NULL on failure to
 * execute at all
 */
- (CamelCipherValidity*)verifySyncWithIpart:(OGCamelMimePart*)ipart cancellable:(OGCancellable*)cancellable;

@end