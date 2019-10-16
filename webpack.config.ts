import * as webpack from 'webpack'
import * as path from 'path'

export default function(env: any): webpack.Configuration {
  return {
    entry: {
      setup: './typescript/setup.ts',
      timer: './typescript/timer.ts'
    },
    target: 'electron-renderer',
    output: {
      path: path.resolve(__dirname),
      filename: '[name].bundle.js',
      publicPath: '/'
    },
    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: [
            { loader: 'elm-hot-loader' },
            {
              loader: 'elm-webpack-loader',
              options: env && env.production ? {} : { debug: false, warn: false }
            }
          ]
        },
        { test: /\.ts$/, loader: 'ts-loader' }
      ]
    },
    resolve: {
      extensions: ['.js', '.ts', '.elm']
    }
  }
}
