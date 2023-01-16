/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceBackendSummarySetup.h"

@implementation OGESourceBackendSummarySetup

- (ESourceBackendSummarySetup*)SOURCEBACKENDSUMMARYSETUP
{
	return E_SOURCE_BACKEND_SUMMARY_SETUP([self GOBJECT]);
}

- (EContactField*)indexedFieldsWithTypes:(EBookIndexType**)types nfields:(gint*)nfields
{
	return e_source_backend_summary_setup_get_indexed_fields([self SOURCEBACKENDSUMMARYSETUP], types, nfields);
}

- (EContactField*)summaryFields:(gint*)nfields
{
	return e_source_backend_summary_setup_get_summary_fields([self SOURCEBACKENDSUMMARYSETUP], nfields);
}

- (void)setIndexedFieldsvWithFields:(EContactField*)fields types:(EBookIndexType*)types nfields:(gint)nfields
{
	e_source_backend_summary_setup_set_indexed_fieldsv([self SOURCEBACKENDSUMMARYSETUP], fields, types, nfields);
}

- (void)setSummaryFieldsvWithFields:(EContactField*)fields nfields:(gint)nfields
{
	e_source_backend_summary_setup_set_summary_fieldsv([self SOURCEBACKENDSUMMARYSETUP], fields, nfields);
}


@end