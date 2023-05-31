# network

## Network
This package includes all the API call related code (network call handelling) and Shared Preference Helper to store user's data.
#
## Structure

The network structured into following folders:

- \'`pubspec.yaml`\' : contains all the dependencies like dio, flutter_riverpod, freezed_annotation, shared_preferences etc. and package configuration.
- \'`lib/core/network`\' : contains the all the endpoints of the API's and dio client to call the API.
- \'`lib/core/shared_preference`\' : contains the helper to save users data and get it back.
- The other folders contain particular API Call Setup which has API request which uses Dio Client, request data model (uses freezed to generate the model) and providers to manage the state.


A few resources to get you understand this :

- [Riverpod](https://riverpod.dev/docs/getting_started)
- [Dio Client](https://pub.dev/packages/dio)
- [Freezed](https://pub.dev/packages/freezed)

