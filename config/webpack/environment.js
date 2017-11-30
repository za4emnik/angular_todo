const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
const config = require('@rails/webpacker/package/config')
const { resolve } = require('path')

environment.plugins.set('ContextReplacement',
  new webpack.ContextReplacementPlugin(
    /angular(\\|\/)core(\\|\/)(@angular|esm5)/,
    resolve(config.source_path)
  )
)
