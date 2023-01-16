/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCredentialsProviderImplOAuth2.h"

@implementation OGESourceCredentialsProviderImplOAuth2

- (ESourceCredentialsProviderImplOAuth2*)SOURCECREDENTIALSPROVIDERIMPLOAUTH2
{
	return E_SOURCE_CREDENTIALS_PROVIDER_IMPL_OAUTH2([self GOBJECT]);
}


@end