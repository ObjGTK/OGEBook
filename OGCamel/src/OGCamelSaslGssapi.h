/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSasl.h"

@interface OGCamelSaslGssapi : OGCamelSasl
{

}

/**
 * Functions
 */
+ (void)load;


/**
 *
 * @return Whether the GSSAPI/KRB5 sasl authentication mechanism is available,
 *    which means whether Camel was built with KRB5 enabled.
 */
+ (bool)isAvailable;

/**
 * Methods
 */

- (CamelSaslGssapi*)castedGObject;

/**
 * Set host and user to use, instead of those in CamelService's settings.
 * It's both or none, aka either set both, or the settings values are used.
 * This is used to not require CamelService instance at all.
 *
 * @param overrideHost Host name to use during challenge processing; can be %NULL
 * @param overrideUser User name to use during challenge processing; can be %NULL
 */
- (void)overrideHostAndUserWithOverrideHost:(OFString*)overrideHost overrideUser:(OFString*)overrideUser;

@end