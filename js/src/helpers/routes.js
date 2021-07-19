import company from 'views/companies/index';

export default () => {
  return {
    mode: 'history',
    routes: [
      {
        name: 'companies',
        path: '/',
        component: company,
      },
    ],
  };
};
