'ngInject'
angular.module 'weatherApp'

.factory 'WeatherFactory', ($resource, SERVICE_URL, API) ->
	$resource SERVICE_URL, {appid: API, units: 'metric'}


