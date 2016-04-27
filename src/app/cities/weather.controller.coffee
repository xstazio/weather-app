angular.module 'weatherApp'
.controller 'WeatherController', ($scope, $timeout, WeatherFactory, FileSaver, Blob) ->
	
	'ngInject'

	$scope.Math = Math

	$scope.weatherForecast = ''

	$scope.newCity = ''
	$scope.citiesList = ['London', 'Moscow', 'Paris']

	$scope.addCity = (newCity) ->
		console.log $scope.citiesList
		for city in $scope.citiesList when city is newCity
			console.log 'already on the list'
			return
		$scope.citiesList.push newCity
		$scope.citiesList.sort(sortCities)
		$scope.newCity = ''

	$scope.removeCity = (city) ->
		for c, index in $scope.citiesList when c is city
			$scope.citiesList.splice(index, 1)

	sortCities = (a, b) ->
		return a.toLowerCase() > b.toLowerCase

	$scope.showWeather = (city) ->
		if city
			WeatherFactory.get({q: city}).$promise.then (data) ->
				$scope.weatherForecast = data
		else
			if (navigator.geolocation)
				navigator.geolocation.getCurrentPosition (position) ->
					WeatherFactory.get({lat: position.coords.latitude, lon: position.coords.longitude}).$promise.then (data) ->
						$scope.weatherForecast = data

	$scope.downloadFile = (city) ->
		data = new Blob [JSON.stringify $scope.weatherForecast], { type: 'text/plain;charset=utf-8' }
		timer = $timeout(FileSaver.saveAs.bind(FileSaver, data, city + '.log'), 100)
		$scope.$on "$destroy", ( event ) ->
			$timeout.cancel(timer)
	