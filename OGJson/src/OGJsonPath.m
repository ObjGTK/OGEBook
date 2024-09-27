/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGJsonPath.h"

@implementation OGJsonPath

+ (JsonNode*)queryWithExpression:(OFString*)expression root:(JsonNode*)root
{
	GError* err = NULL;

	JsonNode* returnValue = json_path_query([expression UTF8String], root, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

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

	bool returnValue = json_path_compile([self castedGObject], [expression UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (JsonNode*)match:(JsonNode*)root
{
	JsonNode* returnValue = json_path_match([self castedGObject], root);

	return returnValue;
}


@end