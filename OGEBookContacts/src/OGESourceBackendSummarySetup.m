/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceBackendSummarySetup.h"

@implementation OGESourceBackendSummarySetup

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_BACKEND_SUMMARY_SETUP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceBackendSummarySetup*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceBackendSummarySetup, ESourceBackendSummarySetup);
}

- (EContactField*)indexedFieldsWithTypes:(EBookIndexType**)types nfields:(gint*)nfields
{
	EContactField* returnValue = (EContactField*)e_source_backend_summary_setup_get_indexed_fields([self castedGObject], types, nfields);

	return returnValue;
}

- (EContactField*)summaryFields:(gint*)nfields
{
	EContactField* returnValue = (EContactField*)e_source_backend_summary_setup_get_summary_fields([self castedGObject], nfields);

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