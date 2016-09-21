'use strict';

angular.module('nea.home.config',[])

    .config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
        function ($stateProvider, $urlRouterProvider, $locationProvider) {

            console.log('ConfigHome');

            $stateProvider.state('home', {
                url: '/home',
                controller: 'CtrlHome',
                templateUrl: 'views/home/home.tpl.html',
                controllerAs: 'vm'
            });

        }])


;
