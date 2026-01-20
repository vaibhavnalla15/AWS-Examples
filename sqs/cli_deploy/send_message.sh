#!/usr/bin/env bash

aws sqs send-message \
--queue-url https://sqs.us-east-1.amazonaws.com/321869098112/tf-queue \
--message-body "Information about the largest city in Any Region." \
--delay-seconds 10 \
--message-attributes file://send-message.json