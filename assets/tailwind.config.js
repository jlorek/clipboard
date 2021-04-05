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
    extend: {
      /* THANKS! */
      /* https://coolors.co/89a3ca-453197-f1e7e4-d1829f-e99b8a*/
      colors: {
        one: {
          light: '#89A3CA',
          DEFAULT: '#6A8BBC'
        },
        two: {
          light: '#453197',
          DEFAULT: '#2A1E5C'
        },
        three: {
          light: '#F1E7E4',
          DEFAULT: '#EEE2DF'
        },
        four: {
          light: '#D1829F',
          DEFAULT: '#C66488'
        },
        five: {
          light: '#E99B8A',
          DEFAULT: '#E4846E'
        },
        'font-dark': {
          DEFAULT: '#011638'
        },
        'font-light': {
          DEFAULT: '#F1FFFA'
        }
      },
    },
  },
  variants: {
    extend: {
      textColor: ['disabled'],
    },
  },
  plugins: [],
}
