@echo off

:: Create the 'packaged' directory if it doesn't exist
if not exist packaged (
    mkdir packaged
)

:: Define the list of packages
set packages=lz4 zlib pcre mimalloc

:: Loop through each package
for %%p in (%packages%) do (
    echo Processing package: %%p

    :: Run the pull_and_build_git.py script
    python scripts/pull_and_build_git.py --platform-name Windows --package-root packages/%%p/ --build-path packages/%%p-windows --clean packages/%%p/

    :: Run the pack_package.py script
    python scripts/pack_package.py --search_path . -o packaged/ packages/%%p/%%p-windows/
)