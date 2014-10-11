module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    uglify:
      compile:
        options:
          sourceMap: true
        src: '<%= pkg.name %>.js'
        dest: '<%= pkg.name %>.min.js'

    watch:
      uglify:
        files: '<%= pkg.name %>.js'
        tasks: ['uglify']


  grunt.registerTask 'default', ['uglify']
