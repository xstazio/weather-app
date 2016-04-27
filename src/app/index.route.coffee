angular.module 'weatherApp' 
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
	'ngInject'
	$stateProvider
	.state 'weather',
		url: '/weather'
		templateUrl: 'app/cities/weather.html'
		controller: 'WeatherController'
		controllerAs: 'weather'

	$urlRouterProvider.otherwise '/weather'
	$locationProvider.html5Mode(false)

