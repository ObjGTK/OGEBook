/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCredentialsProviderImplPassword.h"

@implementation OGESourceCredentialsProviderImplPassword

- (ESourceCredentialsProviderImplPassword*)castedGObject
{
	return E_SOURCE_CREDENTIALS_PROVIDER_IMPL_PASSWORD([self gObject]);
}


@end