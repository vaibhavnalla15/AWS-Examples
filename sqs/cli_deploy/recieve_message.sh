#!/usr/bin/env bash

aws sqs receive-message \
--queue-url https://sqs.us-east-1.amazonaws.com/321869098112/tf-queue \
--attribute-names All \
--message-attribute-names All  \
--max-number-of-messages 5