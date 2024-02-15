/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSMIMEContext.h"

#import "OGCamelMimePart.h"
#import "OGCamelSession.h"

@implementation OGCamelSMIMEContext

- (instancetype)init:(OGCamelSession*)session
{
	CamelSMIMEContext* gobjectValue = CAMEL_SMIME_CONTEXT(camel_smime_context_new([session castedGObject]));

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

- (CamelSMIMEContext*)castedGObject
{
	return CAMEL_SMIME_CONTEXT([self gObject]);
}

- (guint32)describePart:(OGCamelMimePart*)part
{
	guint32 returnValue = camel_smime_context_describe_part([self castedGObject], [part castedGObject]);

	return returnValue;
}

- (void)setEncryptKeyWithUse:(bool)use key:(OFString*)key
{
	camel_smime_context_set_encrypt_key([self castedGObject], use, [key UTF8String]);
}

- (void)setSignMode:(CamelSMIMESign)type
{
	camel_smime_context_set_sign_mode([self castedGObject], type);
}


@end