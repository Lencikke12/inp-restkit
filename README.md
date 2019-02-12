# inpos-restkit

## Overview

	InPos-RestKit is Swift a wrapper around the popular RestKit framework.
	The wrapper contains a basic structure, where each RESTful web service call has its own Command making big project more manageable and easier to isolate errors in the code.

## Submodules

1. inpos-plist-common, 0.0.6
2. inpos-coredata-common, 0.0.10

## How to use:

1. Add this to your Info.plist

``` plist
	<key>IPBuildConfigurationName</key>
	<string>$(CONFIGURATION)</string>
```

2. IPProjectSettings.plist file to your project, that contains baseURLs.

	URLs are set to localhost in this example.

``` plist
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
		<key>IPBaseUrlsKey</key>
		<dict>
			<key>Debug</key>
			<string>http://127.0.0.1:8000/</string>
			<key>Release</key>
			<string>http://127.0.0.1:8000/</string>
			<key>Test</key>
			<string>http://127.0.0.1:8000/</string>
		</dict>
	</dict>
	</plist>
```

3. Add the following like to your AppDelegates -> didFinishLaunching method.

```  swift

	// Web service setup
	WebService.shared.createRestKitFactoryBeforePersistentStore()
	WebService.shared.addFetchRequestBlocks()
```


4. Subclass the following classes provided in the library.
	
	- IPWebService
	- IPAbstractFactory
	- IPPersistentRestKitFactory
	- IPAlamofireFactory  - optional
	- IPIRestKitCommand - add commands to factories mentioned above
	- IPModelController - provide databaseName

5. Happy coding!
