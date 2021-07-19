/* eslint no-console:0 */
import Vue from 'vue';
import Vuex from 'vuex';
import Vuetify from 'vuetify';
import VueRouter from 'vue-router';
import 'vuetify/dist/vuetify.min.css'
import VueScrollTo from 'vue-scrollto';
import * as VueGoogleMaps from 'vue2-google-maps'

import { googleMapsApiKey } from 'helpers/constants';
import layout from 'components/layout';
import routes from 'helpers/routes';
import storeSettings from 'store';

/*
 * Dependencies injection
*/
Vue.use(Vuex);
Vue.use(Vuetify);
Vue.use(VueRouter);
Vue.use(VueScrollTo);
Vue.use(VueGoogleMaps, {
  load: { key: googleMapsApiKey },
  installComponents: true
})

/*
 * Creation of store
*/
export const store = new Vuex.Store(storeSettings);

/*
 * Router setup:
*/
export const router = new VueRouter(routes(store));

/*
 * App initialization:
*/
document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    store,
    router,
    ...layout,
    vuetify: new Vuetify(),
  }).$mount('#root');
});
