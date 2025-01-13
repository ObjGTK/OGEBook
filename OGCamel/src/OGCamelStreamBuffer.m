/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamBuffer.h"

#import <OGio/OGCancellable.h>

@implementation OGCamelStreamBuffer

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STREAM_BUFFER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)streamBufferWithStream:(OGCamelStream*)stream mode:(CamelStreamBufferMode)mode
{
	CamelStreamBuffer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_buffer_new([stream castedGObject], mode), CamelStreamBuffer, CamelStreamBuffer);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelStreamBuffer* wrapperObject;
	@try {
		wrapperObject = [[OGCamelStreamBuffer alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelStreamBuffer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamBuffer, CamelStreamBuffer);
}

- (void)discardCache
{
	camel_stream_buffer_discard_cache([self castedGObject]);
}

- (gint)sWithBuf:(OFString*)buf max:(guint)max cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = (gint)camel_stream_buffer_gets([self castedGObject], g_strdup([buf UTF8String]), max, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OFString*)readLineWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gchar* gobjectValue = camel_stream_buffer_read_line([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}


@end