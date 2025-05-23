/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceWeather.h"

@implementation OGESourceWeather

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_WEATHER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceWeather*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceWeather, ESourceWeather);
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
	ESourceWeatherUnits returnValue = (ESourceWeatherUnits)e_source_weather_get_units([self castedGObject]);

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