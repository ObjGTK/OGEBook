/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCredentialsProviderImplPassword.h"

@implementation OGESourceCredentialsProviderImplPassword

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_CREDENTIALS_PROVIDER_IMPL_PASSWORD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceCredentialsProviderImplPassword*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceCredentialsProviderImplPassword, ESourceCredentialsProviderImplPassword);
}


@end