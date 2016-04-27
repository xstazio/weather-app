'use strict'
'ngInject'

angular.module 'weatherApp'

# Проверка, видим ли элемент, и добавление соотв. классов
.directive 'citySelect', () ->
	restrict: 'A',
	scope: {}
	link: (scope, element, attrs) ->
		element.bind 'click', 'li', (e) ->
			e.preventDefault()

			element.find('li').each () ->
				$(this).removeClass('active')

			$(event.target).parent().addClass('active')