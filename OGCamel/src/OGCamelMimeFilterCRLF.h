/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@interface OGCamelMimeFilterCRLF : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
- (instancetype)initWithDirection:(CamelMimeFilterCRLFDirection)direction mode:(CamelMimeFilterCRLFMode)mode;

/**
 * Methods
 */

- (CamelMimeFilterCRLF*)castedGObject;

/**
 *
 * @return whether the filter will ensure that the output stream will
 *    end with CRLF
 */
- (bool)ensureCrlfEnd;

/**
 * When set to true, the filter will ensure that the output stream will
 * end with CRLF, in case it does not. The default is to not do that.
 * The option is used only when encoding the stream.
 *
 * @param ensureCrlfEnd value to set
 */
- (void)setEnsureCrlfEnd:(bool)ensureCrlfEnd;

@end