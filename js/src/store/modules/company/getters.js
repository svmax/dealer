import { waitingGetters } from 'store-mixins/waiting-mixin';
import { values } from 'lodash';

export default {
  ...waitingGetters,

  getCompanies: state => values(state.companies) || {},

  getSelectedCompany: state => state.companies && state.companies[state.selectedID],

  isSelectedCompany: (state) => (givenID) => state.selectedID === givenID
};