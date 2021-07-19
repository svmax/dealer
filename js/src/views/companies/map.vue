<template>
  <gmap-map :zoom="4" :center="mapCenter" class="map">
    <gmap-marker
      :key="company.id"
      :clickable="true"
      :draggable="true"
      v-for="company in companies"
      :animation="isSelectedCompany(company.id) ? 1 : 0"
      :position="wrapCoordinates(company)"
      @click="selectElement(company)"
    />
  </gmap-map>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import { gmapApi } from "vue2-google-maps";

export default {
  name: "company-map",

  props: {
    companies: Array,
  },

  data() {
    return {
      // center of Europe
      mapCenter: { lat: 48.526, lng: 15.2551 },
    };
  },

  computed: {
    ...mapGetters("company", ["isSelectedCompany", "getSelectedCompany"]),

    google: gmapApi,
  },

  watch: {
    getSelectedCompany(newComp, _) {
      const target = document.getElementById(`company-item-${newComp.id}`);
      this.$scrollTo(target, 300, {
        container: "#companies",
      });

      const [longitude, latitude] = newComp.location;
      this.mapCenter = { lng: longitude, lat: latitude };
    },
  },

  methods: {
    ...mapActions("company", ["selectCompany"]),

    wrapCoordinates({ location }) {
      const [longitude, latitude] = location;
      return this.google && new this.google.maps.LatLng(latitude, longitude);
    },

    selectElement(company) {
      this.selectCompany(company.id);
    },
  },
};
</script>

<style scoped>
.map {
  position: absolute;
  bottom: 0;
  right: 0;
  left: 0;
  top: 0;
}
</style>