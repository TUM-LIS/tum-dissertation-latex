SET docker=docker run --rm --env ORIGINAL_DISS_PATH="%CD%" -v "%CD%":/diss -w /diss andrerichter/tum-dissertation-latex

IF "%1"=="crop" %docker% make crop-local
IF "%1"=="" %docker% make pdf-local
IF "%1"=="clean" %docker% make clean-local
IF "%1"=="placeholder" %docker% make placeholder-local
