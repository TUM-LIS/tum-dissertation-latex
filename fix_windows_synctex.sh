#!/bin/bash
echo "original diss path: $ORIGINAL_DISS_PATH"
gzip -d "dissertation.synctex.gz"
echo "unzipped"
sed -i'' "s|:/diss|:${ORIGINAL_DISS_PATH//\\/\/}|g" dissertation.synctex
echo "sed complete"
gzip dissertation.synctex
echo "gz complete"
touch dissertation.pdf