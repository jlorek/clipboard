module.exports = {
  purge: [
    '../lib/**/*.ex',
    '../lib/**/*.leex',
    '../lib/**/*.eex',
    './js/**/*.js'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      sans: ['Nunito'],
      serif: ['Open Sans']
    },
    extend: {},
  },
  variants: {
    extend: {
    },
  },
  plugins: [],
}
