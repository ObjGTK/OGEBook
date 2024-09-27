/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSMIMEContext.h"

#import "OGCamelMimePart.h"
#import "OGCamelSession.h"

@implementation OGCamelSMIMEContext

+ (OFString*)utilNssErrorToString:(gint)nssErrorCode
{
	const gchar* gobjectValue = camel_smime_context_util_nss_error_to_string(nssErrorCode);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (instancetype)init:(OGCamelSession*)session
{
	CamelSMIMEContext* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_smime_context_new([session castedGObject]), CamelSMIMEContext, CamelSMIMEContext);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSMIMEContext, CamelSMIMEContext);
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