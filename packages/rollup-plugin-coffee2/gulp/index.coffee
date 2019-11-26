# import dd from 'ddeyes'
import path from 'path'
import gulp, { series } from 'gulp'
import task from '../src/gulp'

join = (dir) =>
  path.join __dirname, dir 

task {
  gulp
  series
  join
}

gulp.task 'default'
  , series 'rebuild'
