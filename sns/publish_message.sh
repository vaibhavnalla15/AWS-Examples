#!/usr/bin/env bash

aws sns publish \
--topic-arn "arn:aws:sns:us-east-1:321869098112:alerts-topic" \
--subject "Test SNS Message" \
--message "This is a test message from SNS topic"

