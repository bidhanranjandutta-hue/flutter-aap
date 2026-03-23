#!/bin/bash
find lib -type f -name "*.dart" -exec sed -i "s/\.withOpacity(\([0-9.]*\))/.withValues(alpha: \1)/g" {} +
