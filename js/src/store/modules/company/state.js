import { waitingState } from 'store-mixins/waiting-mixin';

export default {
  ...waitingState,

  selectedID: undefined,
  companies: [],
};