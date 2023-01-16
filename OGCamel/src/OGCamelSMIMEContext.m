/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSMIMEContext.h"

#import "OGCamelMimePart.h"
#import "OGCamelSession.h"

@implementation OGCamelSMIMEContext

- (instancetype)init:(OGCamelSession*)session
{
	self = [super initWithGObject:(GObject*)camel_smime_context_new([session SESSION])];

	return self;
}

- (CamelSMIMEContext*)SMIMECONTEXT
{
	return CAMEL_SMIME_CONTEXT([self GOBJECT]);
}

- (guint32)describePart:(OGCamelMimePart*)part
{
	return camel_smime_context_describe_part([self SMIMECONTEXT], [part MIMEPART]);
}

- (void)setEncryptKeyWithUse:(bool)use key:(OFString*)key
{
	camel_smime_context_set_encrypt_key([self SMIMECONTEXT], use, [key UTF8String]);
}

- (void)setSignMode:(CamelSMIMESign)type
{
	camel_smime_context_set_sign_mode([self SMIMECONTEXT], type);
}


@end