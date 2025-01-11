/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterProgress.h"

#import <OGio/OGCancellable.h>

@implementation OGCamelMimeFilterProgress

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_PROGRESS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mimeFilterProgressWithCancellable:(OGCancellable*)cancellable total:(gsize)total
{
	CamelMimeFilterProgress* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_progress_new([cancellable castedGObject], total), CamelMimeFilterProgress, CamelMimeFilterProgress);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeFilterProgress* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeFilterProgress alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeFilterProgress*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterProgress, CamelMimeFilterProgress);
}


@end