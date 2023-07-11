#!/bin/bash

output="../build/ios_integration"
product="build/ios_integration/Build/Products"
dev_target="16.4"

# Pass --simulator if building for the simulator.
flutter build ios integration_test/integration_test.dart --release

pushd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -config Flutter/Release.xcconfig -derivedDataPath $output -sdk iphoneos build-for-testing
popd

pushd $product
zip -r "flutter_testing_archive.zip" "Release-iphoneos" "Runner_iphoneos$dev_target-arm64.xctestrun"
popd

# Make the first curl request and extract the test_package_url
response=$(curl -u "mikepattyn1:LqzvzsJr14qKy6n4qYnM" \
-X POST "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/ios/test-package" \
-F "file=@$HOME/flutter_testing/build/ios_integration/Build/Products/flutter_testing_archive.zip")

test_package_url=$(echo "$response" | awk -F'"' '{print $8}')

# Make the second curl request and replace the testPackage value
curl -u "mikepattyn1:LqzvzsJr14qKy6n4qYnM" \
-X POST "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/ios/build" \
-d '{"devices": ["iPhone 14-16"], "testPackage":"'"$test_package_url"'","networkLogs":"true","deviceLogs":"true"}' \
-H "Content-Type: application/json"