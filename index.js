const express = require("express")
const app = express()

require("express")

const endpoints = {
    user: "/user/:id",
    location: "/location",
    favoriteLocations: "/favorites",
    weatherDataPresentFuture: "/present_future",
    weatherDataPast: "/past",
    logout: "/logout",
    forgotPassword: "/forgot_password",
    register: "/register",
    login: "/login",
    resetPassword: "/reset_password",
    config: "/config",
    account: "/account",
}
const gets = {
    location: endpoints.location,
    favorites: endpoints.user + endpoints.favoriteLocations,
    presentFuture: endpoints.location + endpoints.weatherDataPresentFuture,
    past: endpoints.location + endpoints.weatherDataPast,
    logout: endpoints.user + endpoints.logout,
    forgotPassword: endpoints.user + endpoints.forgotPassword
}
const posts = {
    favorites: endpoints.user + endpoints.favoriteLocations,
    register: endpoints.register,
}
const puts = {
    login: endpoints.user + endpoints.login,
    resetPassword: endpoints.user + endpoints.resetPassword,
    config: endpoints.user + endpoints.config,
}
const deletes = {
    account: endpoints.user + endpoints.account,
}

app.get(gets.favorites, (req, res) => {

})
app.get(gets.presentFuture, (req, res) => {

})
app.get(gets.past, (req, res) => {

})
app.get(gets.location, (req, res) => {

})
app.get(gets.logout, (req, res) => {

})
app.get(gets.forgotPassword, (req, res) => {

})
app.post(posts.favorites, (req, res) => {

})
app.post(posts.register, (req, res) => {

})
app.put(puts.config, (req, res) => {

})
app.put(puts.login, (req, res) => {

})
app.put(puts.resetPassword, (req, res) => {

})
app.delete(deletes.account, (req, res) => {

})