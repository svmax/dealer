import { waitingMutations } from 'store-mixins/waiting-mixin';
import { RECEIVE_COMPANIES, SELECT_COMPANY } from './types';

export default {
  ...waitingMutations,

  [RECEIVE_COMPANIES] (state, payload) {
    state.companies = payload;
  },

  [SELECT_COMPANY] (state, payload) {
    state.selectedID = payload;
  },
};