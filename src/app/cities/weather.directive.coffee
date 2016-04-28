'use strict'
'ngInject'

angular.module 'weatherApp'

# Adding class 'active' on click
.directive 'citySelect', () ->
	restrict: 'A',
	scope: {}
	link: (scope, element, attrs) ->
		element.bind 'click', 'li', (e) ->
			e.preventDefault()

			element.find('li').each () ->
				$(this).removeClass('active')

			$(event.target).parent().addClass('active')