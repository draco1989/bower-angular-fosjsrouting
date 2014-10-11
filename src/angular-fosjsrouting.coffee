angular
    .module 'fosjsrouting', []
    .filter 'routing', ['$routing', ($routing)->
        (route, params, absolute) ->
            $routing.generate route, params, absolute
    ]            
    .provider '$routing', ->  
        defaultParams = {}

        @setDefaultParams = (params) ->
            angular.extend defaultParams, params

        class Router 
            constructor: (defaultParams, log) ->
                @defaultParams = defaultParams
                @log = log
            generate: (route, params, absolute) ->
                if typeof Routing == 'undefined' or typeof Routing.generate == 'undefined'
                    @log.error 'Cannot generate Symfony2 route. Routing component is not defined.'
                    return route
                Routing.generate route, angular.extend(@defaultParams, params), absolute

        @$get = ['$log', ($log)->
            new Router defaultParams, $log
        ]

        @

