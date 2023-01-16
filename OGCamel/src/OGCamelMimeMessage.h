/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimePart.h"

@class OGCamelInternetAddress;

@interface OGCamelMimeMessage : OGCamelMimePart
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelMimeMessage*)MIMEMESSAGE;

/**
 * Build an MBox from-line from @message.
 *
 * @return an MBox from-line suitable for use in an mbox file
 */
- (OFString*)buildMboxFrom;

/**
 * Dump information about the mime message to stdout.
 * 
 * If body is TRUE, then dump body content of the message as well.
 *
 * @param body whether to dump also message body
 */
- (void)dump:(gint)body;

/**
 * Encode all message parts to a suitable transfer encoding for transport (7bit clean).
 *
 */
- (void)encode8bitParts;

/**
 * Calls @callback for each part of the @message, including the message itself.
 * The traverse of the @message parts can be stopped when the @callback
 * returns %FALSE.
 *
 * @param callback a #CamelForeachPartFunc callback to call for each part
 * @param userData user data passed to the @callback
 */
- (void)foreachPartWithCallback:(CamelForeachPartFunc)callback userData:(gpointer)userData;

/**
 * Get the date and UTC offset of a message.
 * See camel_mime_message_set_date() for information about the @offset format.
 *
 * @param offset output for the UTC offset
 * @return the date of the message
 */
- (time_t)date:(gint*)offset;

/**
 * Get the received date and UTC offset of a message.
 * See camel_mime_message_set_date() for information about the @offset format.
 *
 * @param offset output for the UTC offset
 * @return the received date of the message
 */
- (time_t)dateReceived:(gint*)offset;

/**
 * Get the from address of a message.
 *
 * @return the from address of the message
 */
- (OGCamelInternetAddress*)from;

/**
 * Get the message-id of a message.
 *
 * @return the message-id of a message
 */
- (OFString*)messageId;

/**
 * Get a MIME part by id from a message.
 *
 * @param contentId content-id to search for
 * @return the MIME part with the requested id, or %NULL if not found
 */
- (OGCamelMimePart*)partByContentId:(OFString*)contentId;

/**
 * Get the message recipients of a specified type.
 *
 * @param type recipient type
 * @return the requested recipients
 */
- (OGCamelInternetAddress*)recipients:(OFString*)type;

/**
 * Get the Reply-To of a message.
 *
 * @return the Reply-To address of the message
 */
- (OGCamelInternetAddress*)replyTo;

/**
 * Get the UID of the source account of the message.
 *
 * @return the uid of the source account
 */
- (OFString*)source;

/**
 * Get the UTF-8 subject text of a message.
 *
 * @return the message subject
 */
- (OFString*)subject;

/**
 * Find out if a message contains 8bit or binary encoded parts.
 *
 * @return %TRUE if the message contains 8bit parts or %FALSE otherwise
 */
- (bool)has8bitParts;

/**
 * Returns whether message contains at least one attachment part.
 *
 * @return
 */
- (bool)hasAttachment;

/**
 * Re-encode all message parts to conform with the required encoding rules.
 * 
 * If @enctype is #CAMEL_BESTENC_7BIT, then all parts will be re-encoded into
 * one of the 7bit transfer encodings. If @enctype is #CAMEL_BESTENC_8BIT, all
 * parts will be re-encoded to either a 7bit encoding or, if the part is 8bit
 * text, allowed to stay 8bit. If @enctype is #CAMEL_BESTENC_BINARY, then binary
 * parts will be encoded as binary and 8bit textual parts will be encoded as 8bit.
 *
 * @param required a bitwise ORing of #CAMEL_BESTENC_GET_ENCODING and #CAMEL_BESTENC_GET_CHARSET
 * @param enctype an encoding to enforce
 */
- (void)setBestEncodingWithRequired:(CamelBestencRequired)required enctype:(CamelBestencEncoding)enctype;

/**
 * Set the date on a message.
 * 
 * In most cases, this is used to set the current date:
 * |[<!-- language="C" -->
 * camel_mime_message_set_date (message, CAMEL_MESSAGE_DATE_CURRENT, 0);
 * ]|
 *
 * @param date a time_t date or %CAMEL_MESSAGE_DATE_CURRENT to use the current local date and time
 * @param offset an offset from UTC in decimal number using the +HHMM format (for instance an offset
 *   of -10:45 is -1045). If @date set to %CAMEL_MESSAGE_DATE_CURRENT, this parameter is ignored
 */
- (void)setDateWithDate:(time_t)date offset:(gint)offset;

/**
 * Set the from address of a message.
 *
 * @param from a #CamelInternetAddress object
 */
- (void)setFrom:(OGCamelInternetAddress*)from;

/**
 * Set the message-id on a message.
 *
 * @param messageId id of the message, or %NULL to generate a new one using the from address
 */
- (void)setMessageId:(OFString*)messageId;

/**
 * Set the recipients of a message.
 *
 * @param type recipient type (one of #CAMEL_RECIPIENT_TYPE_TO, #CAMEL_RECIPIENT_TYPE_CC, or #CAMEL_RECIPIENT_TYPE_BCC)
 * @param recipients a #CamelInternetAddress with the recipient addresses set or %NULL
 *   to remove the already defined one
 */
- (void)setRecipientsWithType:(OFString*)type recipients:(OGCamelInternetAddress*)recipients;

/**
 * Set the Reply-To of a message.
 *
 * @param replyTo a #CamelInternetAddress object
 */
- (void)setReplyTo:(OGCamelInternetAddress*)replyTo;

/**
 * Set the UID of the source account of the message.
 *
 * @param sourceUid the uid of the source account
 */
- (void)setSource:(OFString*)sourceUid;

/**
 * Set the subject text of a message.
 *
 * @param subject UTF-8 message subject
 */
- (void)setSubject:(OFString*)subject;

@end