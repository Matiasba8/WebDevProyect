const { environment } = require('@rails/webpacker')
const webpack = require("webpack")
environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    JQuery: 'jquery',
    Popper: ['popper.js', 'default']
}))
// import { environment } from '@rails/webpacker'
// import { ProvidePlugin } from 'webpack'
//     enviroment.plugins.append('Provide',
//         new ProvidePlugin({
//             $: 'jquery',
//             JQuery: 'jquery',
//             Popper: ['popper.js','default']
//         })
//     )

module.exports = environment
