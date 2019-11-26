import del from 'del'
import rename from 'gulp-rename'
import rollup from 'gulp-better-rollup'
import cleanup from 'rollup-plugin-cleanup'

import coffee2 from './coffee2'
import babel from './babel'

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
    }
  ) => =>
    gulp.src index
    .pipe rollup
      plugins: [
        coffee2
          bare: true
          sourceMap: true
        cleanup()
      ]
    , 'es'
    .pipe rename 'index.js'
    .pipe gulp.dest dest

  buildCjs: (
    gulp
    {
      index
      dest
    }
  ) => =>
    gulp.src index
    .pipe rollup
      plugins: [
        babel()
        cleanup()
      ]
    , 'cjs'
    .pipe rename 'index.js'
    .pipe gulp.dest dest

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
