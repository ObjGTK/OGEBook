/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailSignature.h"

@implementation OGESourceMailSignature

- (ESourceMailSignature*)SOURCEMAILSIGNATURE
{
	return E_SOURCE_MAIL_SIGNATURE([self GOBJECT]);
}

- (OFString*)dupMimeType
{
	return [OFString stringWithUTF8String:e_source_mail_signature_dup_mime_type([self SOURCEMAILSIGNATURE])];
}

- (GFile*)file
{
	return e_source_mail_signature_get_file([self SOURCEMAILSIGNATURE]);
}

- (OFString*)mimeType
{
	return [OFString stringWithUTF8String:e_source_mail_signature_get_mime_type([self SOURCEMAILSIGNATURE])];
}

- (void)setMimeType:(OFString*)mimeType
{
	e_source_mail_signature_set_mime_type([self SOURCEMAILSIGNATURE], [mimeType UTF8String]);
}


@end