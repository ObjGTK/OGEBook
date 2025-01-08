/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOperation.h"

@implementation OGCamelOperation

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_OPERATION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (void)cancelAll
{
	camel_operation_cancel_all();
}

+ (OFString*)dupMessage:(OGCancellable*)cancellable
{
	gchar* gobjectValue = camel_operation_dup_message([cancellable castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

+ (void)popMessage:(OGCancellable*)cancellable
{
	camel_operation_pop_message([cancellable castedGObject]);
}

+ (void)progressWithCancellable:(OGCancellable*)cancellable percent:(gint)percent
{
	camel_operation_progress([cancellable castedGObject], percent);
}

- (instancetype)init
{
	CamelOperation* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_operation_new(), CamelOperation, CamelOperation);

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

- (instancetype)initWithCancellableProxy:(OGCancellable*)cancellable
{
	CamelOperation* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_operation_new_proxy([cancellable castedGObject]), CamelOperation, CamelOperation);

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

- (CamelOperation*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelOperation, CamelOperation);
}


@end