#!/bin/bash
ssh-keygen -t ed25519 -C "your@example"
ssh-add "$HOME/.ssh/id_ed25519"
