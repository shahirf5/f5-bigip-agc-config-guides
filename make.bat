@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=python -msphinx
)
set SOURCEDIR=source
set BUILDDIR=build
set SPHINXPROJ=myproject

if "%1" == "" goto help

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The Sphinx module was not found. Make sure you have Sphinx installed,
	echo.then set the SPHINXBUILD environment variable to point to the full
	echo.path of the 'sphinx-build' executable. Alternatively you may add the
	echo.Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS%
goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS%

if "%1" == "source-cleanup" (
	rm -rf %SOURCEDIR%/saml-*
	goto end
)
if "%1" == "docs" (
	rm -rf %BUILDDIR%
	./scripts/merge-docs.sh
	make html
	if errorlevel 1 exit /b 1
	goto end
)
if "%1" == "livedocs" (
	./scripts/merge-docs.sh
	echo.Running sphinx-autobuild.
	sphinx-autobuild --host 0.0.0.0 -b html %ALLSPHINXOPTS% %BUILDDIR%/html
	if errorlevel 1 exit /b 1
	echo.
	echo.Build finished. View live edits at:
	echo.  http://127.0.0.1:8000/index.html
	goto end
)
if "%1" == "testdocs" (
	echo.Running test script.
	echo.View results below.
	./scripts/merge-docs.sh
	./scripts/test-docs.sh
	if errorlevel 1 exit /b 1
	goto end
)
if "%1" == "docker-docs" (
	./scripts/merge-docs.sh
	rm -rf %BUILDDIR%
	./scripts/merge-docs.sh
	./scripts/docker-docs.sh make html
	goto end
)
if "%1" == "docker-livedocs" (
	./scripts/merge-docs.sh
	echo.Running sphinx-autobuild in docker.
	DOCKER_RUN_ARGS="-p 127.0.0.1:8000:8000" ./scripts/docker-docs.sh \
	  make livehtml
	if errorlevel 1 exit /b 1
	echo.
	echo.Build finished. View live edits at:
	echo.  http://127.0.0.1:8000/index.html
	goto end
)
if "%1" == "docker-testdocs" (
	echo.Running test script in docker.
	echo.View results below.
	./scripts/docker-docs.sh ./scripts/test-docs.sh
	if errorlevel 1 exit /b 1
	goto end
)
:end
popd
