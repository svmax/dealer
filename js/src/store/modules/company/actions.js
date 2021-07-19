import { receiveCompaniesRequest } from './api';
import { RECEIVE_COMPANIES, SELECT_COMPANY } from './types';
import { START_WAITING, STOP_WAITING } from 'store-mixins/waiting-mixin';

export default {
  async receiveCompanies({ commit }, payload = {}) {
    try {
      await commit(START_WAITING);
      const { data } = await receiveCompaniesRequest(payload);
      await commit(RECEIVE_COMPANIES, data);
    } catch (error) {
      console.log(error.message);
    } finally {
      await commit(STOP_WAITING);
    }
  },

  async selectCompany({ commit }, id) {
    try {
      await commit(START_WAITING);
      await commit(SELECT_COMPANY, id);
    } catch (error) {
      console.log(error.message);
    } finally {
      await commit(STOP_WAITING);
    }
  },
};