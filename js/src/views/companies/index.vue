<template>
  <v-layout row wrap>
    <v-flex xs12 md8>
      <v-card class="map-container">
        <v-card-text>
          <Map :companies="getCompanies" />
        </v-card-text>
      </v-card>
    </v-flex>

    <v-flex xs12 md4>
      <v-card>
        <v-card-title>
          <h3>Companies</h3>
        </v-card-title>

        <v-divider />

        <v-card-text class="pt-0 px-0">
          <List :companies="getCompanies" />
        </v-card-text>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import List from "./list";
import Map from "./map";

export default {
  name: "company",

  components: {
    List,
    Map,
  },

  computed: mapGetters("company", ["getCompanies", "isWaiting"]),

  mounted() {
    this.receiveCompanies();
  },

  methods: mapActions("company", ["receiveCompanies"]),
};
</script>

<style scoped>
.map-container {
  min-height: 300px;
  height: 100%;
  width: 100%;
}
</style>