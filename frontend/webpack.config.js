const VueLoaderPlugin = require('vue-loader/lib/plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')

module.exports = {
  mode: 'development',
  entry: `./src/main.js`,
  output: {
    filename: 'index.js',
    path: (`${__dirname}/dist`)
  },
  module: {
    rules: [
      //*scss rules*
      {
        test: /\.scss$/,
        use: [
          //'style-loader',
          MiniCssExtractPlugin.loader,
          {
            loader: 'css-loader',
            options: {
              url: false,
              sourceMap: true,
              // 0 => no loaders (default);
              // 1 => postcss-loader;
              // 2 => postcss-loader, sass-loader
              importLoaders: 2
            },
          },
          {
            loader: 'postcss-loader',
            options: {
              sourceMap: true,
              plugins: () => [
                require('autoprefixer')
              ]
            }
          },
          {
            loader: 'sass-loader',
            options: {
              sourceMap: true,
            }
          },
        ],
      },
      //*Vue.js rules*
      {
        test: /\.vue$/, 
        loader: 'vue-loader',
      },
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
      //*pug rules*
      {
        test: /\.pug$/,
        loader: 'pug-plain-loader'
      },
    ]
  },
  plugins: [
    new VueLoaderPlugin(),
    new MiniCssExtractPlugin({ filename: 'index.css' }),
  ],
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    },
    extensions: ['*', '.js', '.vue', '.json']
  },
  devServer: {
    historyApiFallback: true,
    noInfo: true,
  },
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    }
  },
  performance: {
    hints: false
  },
  devtool: 'source-map'
}
