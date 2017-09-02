
var gulp = require('gulp');
var shell = require('gulp-shell');
var minifyHTML = require('gulp-minify-html');
var runSequence = require('run-sequence');
var autoprefixer = require('gulp-autoprefixer');
var uncss = require('gulp-uncss');
var minifyCss = require('gulp-minify-css');
var imagemin = require('gulp-imagemin');
var pngquant = require('imagemin-pngquant');
var jpegtran = require('imagemin-jpegtran');
var gifsicle = require('imagemin-gifsicle');
var replace = require('gulp-replace');
var fs = require('fs');

gulp.task('jekyll-build', function () {
	return gulp.src('index.html', { read: false })
		.pipe(shell([
			'bundle exec jekyll build --config _config.yml'
		]));
});

gulp.task('jekyll-build-staging', function () {
	return gulp.src('index.html', { read: false })
		.pipe(shell([
			'bundle exec jekyll build --config _config-staging.yml'
		]));
});

gulp.task('optimize-images', function () {
	return gulp.src(['_site/**/*.jpg', '_site/**/*.jpeg', '_site/**/*.gif', '_site/**/*.png'])
		.pipe(imagemin({
			progressive: false,
			svgoPlugins: [{ removeViewBox: false }],
			use: [pngquant(), jpegtran(), gifsicle()]
		}))
		.pipe(gulp.dest('_site/'));
});


gulp.task('optimize-css', function () {
	return gulp.src('_site/assets/css/main.css')
		.pipe(autoprefixer())
		// Deactiated because it was not working together with AddThis and Cookie-Bar
		// .pipe(uncss({
		//  html: ['_site/**/*.html'],
		//  ignore: []
		// }))
		.pipe(minifyCss({ keepBreaks: false }))
		.pipe(gulp.dest('_site/assets/css/'));
});

gulp.task('optimize-html', function () {
	return gulp.src('_site/**/*.html')
		.pipe(minifyHTML({
			quotes: true
		}))
		.pipe(replace('<link rel="stylesheet" href="/assets/css/main.css">', function (s) {
			var style = fs.readFileSync('_site/assets/css/main.css', 'utf8');
			return '<style>\n' + style + '\n</style>';
		}))
		.pipe(gulp.dest('_site/'));
});

gulp.task('build', function (callback) {
	runSequence(
		'jekyll-build',
		'optimize-images',
		'optimize-css',
		'optimize-html',
		callback
	);
});

gulp.task('build-staging', function (callback) {
	runSequence(
		'jekyll-build-staging',
		'optimize-images',
		'optimize-css',
		'optimize-html',
		callback
	);
});

gulp.task('assets', function (callback) {
	runSequence(
		'optimize-images',
		'optimize-css',
		callback
	);
});

gulp.task('css', function (callback) {
	runSequence(
		'optimize-css',
		callback
	);
});
