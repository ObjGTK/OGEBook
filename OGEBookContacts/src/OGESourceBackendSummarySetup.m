/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceBackendSummarySetup.h"

@implementation OGESourceBackendSummarySetup

- (ESourceBackendSummarySetup*)castedGObject
{
	return E_SOURCE_BACKEND_SUMMARY_SETUP([self gObject]);
}

- (EContactField*)indexedFieldsWithTypes:(EBookIndexType**)types nfields:(gint*)nfields
{
	EContactField* returnValue = e_source_backend_summary_setup_get_indexed_fields([self castedGObject], types, nfields);

	return returnValue;
}

- (EContactField*)summaryFields:(gint*)nfields
{
	EContactField* returnValue = e_source_backend_summary_setup_get_summary_fields([self castedGObject], nfields);

	return returnValue;
}

- (void)setIndexedFieldsvWithFields:(EContactField*)fields types:(EBookIndexType*)types nfields:(gint)nfields
{
	e_source_backend_summary_setup_set_indexed_fieldsv([self castedGObject], fields, types, nfields);
}

- (void)setSummaryFieldsvWithFields:(EContactField*)fields nfields:(gint)nfields
{
	e_source_backend_summary_setup_set_summary_fieldsv([self castedGObject], fields, nfields);
}


@end