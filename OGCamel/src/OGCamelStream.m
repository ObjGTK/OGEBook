/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStream.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGIOStream.h>

@implementation OGCamelStream

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STREAM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)streamWithBaseStream:(OGIOStream*)baseStream
{
	CamelStream* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_new([baseStream castedGObject]), CamelStream, CamelStream);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelStream* wrapperObject;
	@try {
		wrapperObject = [[OGCamelStream alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelStream*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStream, CamelStream);
}

- (gint)closeWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = (gint)camel_stream_close([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)eos
{
	bool returnValue = (bool)camel_stream_eos([self castedGObject]);

	return returnValue;
}

- (gint)flushWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = (gint)camel_stream_flush([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gssize)readWithBuffer:(OFString*)buffer n:(gsize)n cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_stream_read([self castedGObject], g_strdup([buffer UTF8String]), n, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGIOStream*)refBaseStream
{
	GIOStream* gobjectValue = camel_stream_ref_base_stream([self castedGObject]);

	OGIOStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setBaseStream:(OGIOStream*)baseStream
{
	camel_stream_set_base_stream([self castedGObject], [baseStream castedGObject]);
}

- (gssize)writeWithBuffer:(OFString*)buffer n:(gsize)n cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_stream_write([self castedGObject], [buffer UTF8String], n, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gssize)writeString:(OFString*)string cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_stream_write_string([self castedGObject], [string UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gssize)writeToStreamWithOutputStream:(OGCamelStream*)outputStream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_stream_write_to_stream([self castedGObject], [outputStream castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end