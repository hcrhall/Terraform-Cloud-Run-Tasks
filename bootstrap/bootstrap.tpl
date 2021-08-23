#!/bin/bash

curl \
--header "Authorization: Bearer ${TOKEN}" \
--header "Content-Type: application/vnd.api+json" \
--request POST \
--url https://app.terraform.io/api/v2/organizations/${ORG}/event-hooks \
--data '{"data":{"type":"event-hooks","attributes":{"name":"${NAME}","url":"${URL}","hmac_key":"1234567890","category":"task"}}}'