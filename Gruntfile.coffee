module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      options:
        bare: true
      compile:
        src: ['src/*.coffee']
        dest: '<%= pkg.name %>.js'

    uglify:
      compile:
        options:
          sourceMap: true
        src: '<%= pkg.name %>.js'
        dest: '<%= pkg.name %>.min.js'

    watch:
      coffee:
        files: ['src/*.coffee']
        tasks: ['coffee']
      uglify:
        files: '<%= pkg.name %>.js'
        tasks: ['uglify']


  grunt.registerTask 'default', ['coffee', 'uglify']
