/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceWeather.h"

@implementation OGESourceWeather

- (ESourceWeather*)castedGObject
{
	return E_SOURCE_WEATHER([self gObject]);
}

- (OFString*)dupLocation
{
	gchar* gobjectValue = e_source_weather_dup_location([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)location
{
	const gchar* gobjectValue = e_source_weather_get_location([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (ESourceWeatherUnits)units
{
	ESourceWeatherUnits returnValue = e_source_weather_get_units([self castedGObject]);

	return returnValue;
}

- (void)setLocation:(OFString*)location
{
	e_source_weather_set_location([self castedGObject], [location UTF8String]);
}

- (void)setUnits:(ESourceWeatherUnits)units
{
	e_source_weather_set_units([self castedGObject], units);
}


@end