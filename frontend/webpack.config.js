const { VueLoaderPlugin } = require('vue-loader')

const MODE = 'development'
const enabledSourceMap = MODE === 'development'

module.exports = {
  mode: MODE,
  devtool: 'source-map',
  entry: `./src/main.js`,
  output: {
    filename: 'bundle.js',
    path: (`${__dirname}/dist`)
  },
  module: {
    rules: [
      //*javascript rules*
      {
        test: /\.js$/, 
        exclude: /node_modules/, 
        loader: 'babel-loader',
        options: {
          presets: ['@babel/preset-env']
        }
      },
      {
        enforce: 'pre',
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'eslint-loader'
      },
      //*Vue.js rules*
      {
        test: /\.vue$/, 
        loader: 'vue-loader'
      },
      //*pug rules*
      {
        test: /\.pug$/,
        loader: 'pug-plain-loader'
      },
      //*scss rules*
      {
        test: /\.scss/,
        use: [
          'style-loader',
          {
            loader: 'css-loader',
            options: {
              url: false,
              sourceMap: enabledSourceMap,
              // 0 => no loaders (default);
              // 1 => postcss-loader;
              // 2 => postcss-loader, sass-loader
              importLoaders: 2
            },
          },
          {
            loader: 'postcss-loader',
            options: {
              sourceMap: enabledSourceMap,
              plugins: [
                require('autoprefixer')({
                  grid: true
                })
              ]
            }
          },
          {
            loader: 'sass-loader',
            options: {
              sourceMap: enabledSourceMap,
            }
          }
        ]
      }
    ]
  },
  plugins: [
    new VueLoaderPlugin(),
  ],
  devServer: {
    contentBase: 'dist',
    open: true
  }
}
