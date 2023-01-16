/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelCipherContext.h"

#import "OGCamelMimePart.h"
#import "OGCamelSession.h"

@implementation OGCamelCipherContext

- (instancetype)init:(OGCamelSession*)session
{
	self = [super initWithGObject:(GObject*)camel_cipher_context_new([session SESSION])];

	return self;
}

- (CamelCipherContext*)CIPHERCONTEXT
{
	return CAMEL_CIPHER_CONTEXT([self GOBJECT]);
}

- (void)decryptWithIpart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_cipher_context_decrypt([self CIPHERCONTEXT], [ipart MIMEPART], [opart MIMEPART], ioPriority, cancellable, callback, userData);
}

- (CamelCipherValidity*)decryptFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_cipher_context_decrypt_finish([self CIPHERCONTEXT], result, err);
}

- (CamelCipherValidity*)decryptSyncWithIpart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_cipher_context_decrypt_sync([self CIPHERCONTEXT], [ipart MIMEPART], [opart MIMEPART], cancellable, err);
}

- (void)encryptWithUserid:(OFString*)userid recipients:(GPtrArray*)recipients ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_cipher_context_encrypt([self CIPHERCONTEXT], [userid UTF8String], recipients, [ipart MIMEPART], [opart MIMEPART], ioPriority, cancellable, callback, userData);
}

- (bool)encryptFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_cipher_context_encrypt_finish([self CIPHERCONTEXT], result, err);
}

- (bool)encryptSyncWithUserid:(OFString*)userid recipients:(GPtrArray*)recipients ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_cipher_context_encrypt_sync([self CIPHERCONTEXT], [userid UTF8String], recipients, [ipart MIMEPART], [opart MIMEPART], cancellable, err);
}

- (OGCamelSession*)session
{
	return [[[OGCamelSession alloc] initWithGObject:(GObject*)camel_cipher_context_get_session([self CIPHERCONTEXT])] autorelease];
}

- (OFString*)hashToId:(CamelCipherHash)hash
{
	return [OFString stringWithUTF8String:camel_cipher_context_hash_to_id([self CIPHERCONTEXT], hash)];
}

- (CamelCipherHash)idToHash:(OFString*)id
{
	return camel_cipher_context_id_to_hash([self CIPHERCONTEXT], [id UTF8String]);
}

- (void)signWithUserid:(OFString*)userid hash:(CamelCipherHash)hash ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_cipher_context_sign([self CIPHERCONTEXT], [userid UTF8String], hash, [ipart MIMEPART], [opart MIMEPART], ioPriority, cancellable, callback, userData);
}

- (bool)signFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_cipher_context_sign_finish([self CIPHERCONTEXT], result, err);
}

- (bool)signSyncWithUserid:(OFString*)userid hash:(CamelCipherHash)hash ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_cipher_context_sign_sync([self CIPHERCONTEXT], [userid UTF8String], hash, [ipart MIMEPART], [opart MIMEPART], cancellable, err);
}

- (void)verifyWithIpart:(OGCamelMimePart*)ipart ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_cipher_context_verify([self CIPHERCONTEXT], [ipart MIMEPART], ioPriority, cancellable, callback, userData);
}

- (CamelCipherValidity*)verifyFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_cipher_context_verify_finish([self CIPHERCONTEXT], result, err);
}

- (CamelCipherValidity*)verifySyncWithIpart:(OGCamelMimePart*)ipart cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_cipher_context_verify_sync([self CIPHERCONTEXT], [ipart MIMEPART], cancellable, err);
}


@end