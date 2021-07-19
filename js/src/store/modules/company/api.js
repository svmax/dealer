import { normalize } from 'normalizr';
import { apiRequest } from 'helpers/requests';
import { Company } from './schemas';

export const receiveCompaniesRequest = (data, options = {}) => apiRequest({
  url: '/companies',
  params: data,
  transformResponse: resp => {
    const jsonResp = JSON.parse(resp);
    const { companies } = normalize(jsonResp, [Company]).entities;

    return companies;
  },
  ...options,
});
