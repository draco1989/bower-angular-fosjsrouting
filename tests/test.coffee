
class Router
    generate: (path, params, absolute) ->
        route = path
        route = 'generated_route' if not absolute
        route = 'generated_route_abs' if absolute
        for param, replacement of params
            route = route.replace param, replacement
        route

Routing = new Router

describe 'fosjsrouting', ->
    $routing = null
    $filter = null

    beforeEach ->
        module 'fosjsrouting'
        inject (_$routing_, _$filter_) ->
            $routing = _$routing_
            $filter = _$filter_
      
    it 'should have Routing defined',  ->
        expect(Routing).toBeDefined()  

    it 'service should return relative path',  ->
        expect($routing.generate 'path').toEqual 'generated_route'  

    it 'service should return absolute path',  ->
        expect($routing.generate 'path', null, true).toEqual 'generated_route_abs'  

    it 'filter should return relative path', ->
        expect($filter('routing') 'path').toEqual 'generated_route'

    it 'filter should return absolute path',  ->
        expect($filter('routing') 'path', null, true).toEqual 'generated_route_abs' 

describe 'fosjsrouting', ->
    $routing = null
    $filter = null

    beforeEach ->
        module 'fosjsrouting'
        module ($routingProvider) -> 
            $routingProvider.setDefaultParams
                route: 'path'
            angular.noop
        inject (_$routing_, _$filter_) ->
            $routing = _$routing_
            $filter = _$filter_
      
    it 'should have Routing defined',  ->
        expect(Routing).toBeDefined()  

    it 'service should return relative path',  ->
        expect($routing.generate 'path').toEqual 'generated_path'  

    it 'service should return absolute path',  ->
        expect($routing.generate 'path', {generated: 'custom'}, true).toEqual 'custom_path_abs'


describe 'fosjsrouting', ->
    $routing = null
    $filter = null

    beforeEach ->
        module 'fosjsrouting'
        Routing = undefined
        inject (_$routing_, _$filter_) ->
            $routing = _$routing_
            $filter = _$filter_

    it 'service should return path_name when no Routing is defined',  ->
        expect($routing.generate 'path').toEqual 'path'

    it 'filter should return path_name when no Routing is defined',  ->
        expect($filter('routing') 'path').toEqual 'path'
 