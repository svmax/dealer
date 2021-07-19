import company from './modules/company';

export default {
  modules: {
    company,
  },

  strict: process.env.NODE_ENV !== 'production',
};
