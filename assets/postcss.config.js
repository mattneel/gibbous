module.exports = {
  plugins: [
    require("precss"),
    require("postcss-import"),
    require("tailwindcss")("./tailwind.js"),
    require("autoprefixer")
  ]
};
