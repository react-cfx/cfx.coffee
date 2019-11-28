import del from 'del'
import rename from 'gulp-rename'
import rollup from 'gulp-better-rollup'
import cleanup from 'rollup-plugin-cleanup'

import coffee2 from './coffee2'
import babel from './babel'

gulpTask = (
  gulp
  {
    plugins
    format
    fileName = 'index.js'
    index
    dest
  }
) =>
  gulp.src index
  .pipe(
    rollup
      plugins: [
        plugins...
        cleanup()
      ]
    , format
  )
  .pipe rename fileName
  .pipe gulp.dest dest

tasks =

  clean: (_dirs) =>

    (cb) =>
      dirs =
        if Array.isArray _dirs
        then _dirs
        else [ _dirs ]
      del dirs
      , cb

  buildEs: (
    gulp
    {
      index
      dest
      fileName
    }
  ) => =>
    gulpTask gulp
    , {
      plugins: [
        coffee2
          bare: true
          sourceMap: true
      ]
      format: 'es'
      fileName
      index
      dest
    }

  buildCjs: (
    gulp
    {
      index
      dest
      fileName
    }
  ) => =>
    gulpTask gulp
    , {
      plugins: [
        babel()
      ]
      format: 'cjs'
      fileName
      index
      dest
    }

  build: (series) =>
    series(
      'buildEs'
      'buildCjs'
    )

  rebuild: (series) =>
    series(
      'clean'
      'build'
    )

export {
  tasks
}

export default ({
  gulp
  series
  join
}) =>

  gulp.task 'clean'
  , tasks.clean join '../dist'

  gulp.task 'buildEs'
  ,
    tasks.buildEs gulp
    ,
      index: join '../src/index.coffee'
      dest: join '../dist/es'

  gulp.task 'buildCjs'
  ,
    tasks.buildCjs gulp
    ,
      index: join '../dist/es/index.js'
      dest: join '../dist'

  gulp.task 'build'
  ,
    tasks.build series

  gulp.task 'rebuild'
  ,
    tasks.rebuild series
