# my_assets

## Balador-CustomerApp Assets
This package includes all the icons, images and other json files which required in the app.
#
## Structure

The my_assets structured into following folders:

- \'`pubspec.yaml`\' : contains all the dependencies like flutter gen, flutter svg etc. and package configuration.
- \'`assets/`\' : contains all the images, icons and json files.
- \'`lib/`\' : contains all the generated necessary files.
#
## Usage

This project uses flutter gen to generate assets.

For assets generation :

**Step 1.** If fluttergen not activated run this command:
```console
dart pub global activate flutter_gen

export PATH="$PATH":"$HOME/.pub-cache/bin
```

**Step 2.** Put the assets which you need to access all over the app inside (packages/my_assets/assets/images/)

**Step 3.** Run the following command to generate MyAssets class which stores asset information and configuration.
```console
fluttergen -c pubspec.yaml
```

**Step 4.** You can access the assets all over the app now like following:
```dart
 MyAssets.images.<asset_name>.image()
```

for more information click [here](https://pub.dev/packages/flutter_gen)