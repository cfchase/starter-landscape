#!/usr/bin/env bash

echo "Rolling out new version of landscape"
oc rollout latest dc/starter-landscape
