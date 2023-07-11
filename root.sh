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
