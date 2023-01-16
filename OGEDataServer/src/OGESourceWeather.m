/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceWeather.h"

@implementation OGESourceWeather

- (ESourceWeather*)SOURCEWEATHER
{
	return E_SOURCE_WEATHER([self GOBJECT]);
}

- (OFString*)dupLocation
{
	return [OFString stringWithUTF8String:e_source_weather_dup_location([self SOURCEWEATHER])];
}

- (OFString*)location
{
	return [OFString stringWithUTF8String:e_source_weather_get_location([self SOURCEWEATHER])];
}

- (ESourceWeatherUnits)units
{
	return e_source_weather_get_units([self SOURCEWEATHER]);
}

- (void)setLocation:(OFString*)location
{
	e_source_weather_set_location([self SOURCEWEATHER], [location UTF8String]);
}

- (void)setUnits:(ESourceWeatherUnits)units
{
	e_source_weather_set_units([self SOURCEWEATHER], units);
}


@end