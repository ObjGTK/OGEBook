/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGJsonPath.h"

@implementation OGJsonPath

+ (void)load
{
	GType gtypeToAssociate = JSON_TYPE_PATH;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (JsonNode*)queryWithExpression:(OFString*)expression root:(JsonNode*)root
{
	GError* err = NULL;

	JsonNode* returnValue = (JsonNode*)json_path_query([expression UTF8String], root, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (instancetype)init
{
	JsonPath* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_path_new(), JsonPath, JsonPath);

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

- (JsonPath*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], JsonPath, JsonPath);
}

- (bool)compile:(OFString*)expression
{
	GError* err = NULL;

	bool returnValue = (bool)json_path_compile([self castedGObject], [expression UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (JsonNode*)match:(JsonNode*)root
{
	JsonNode* returnValue = (JsonNode*)json_path_match([self castedGObject], root);

	return returnValue;
}


@end