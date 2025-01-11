# Create the 'packaged' directory if it doesn't exist
New-Item -ItemType Directory -Path "packaged" -Force | Out-Null

# Define the list of packages
$packages = @("lz4", "zlib", "pcre", "mimalloc")

# Loop through each package
foreach ($package in $packages) {
    # Run the pull_and_build_git.py script
    python scripts/pull_and_build_git.py --platform-name Windows --package-root "packages/$package/" --build-path "packages/$package-windows" --clean "packages/$package/"

    # Run the pack_package.py script
    python scripts/pack_package.py --search_path . -o "packaged/" "packages/$package/$package-windows/"
}