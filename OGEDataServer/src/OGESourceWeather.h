/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

@interface OGESourceWeather : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceWeather*)SOURCEWEATHER;

/**
 *
 * @return
 */
- (OFString*)dupLocation;

/**
 *
 * @return
 */
- (OFString*)location;

/**
 *
 * @return
 */
- (ESourceWeatherUnits)units;

/**
 *
 * @param location
 */
- (void)setLocation:(OFString*)location;

/**
 *
 * @param units
 */
- (void)setUnits:(ESourceWeatherUnits)units;

@end