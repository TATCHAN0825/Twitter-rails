const {environment} = require('@rails/webpacker')

//ここから
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery'
    })
)
//ここまで

module.exports = environment
