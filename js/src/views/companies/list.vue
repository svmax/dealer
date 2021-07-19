<template>
  <v-list class="list pt-0" id="companies">
    <template v-for="item in companies">
      <v-list-item
        :key="item.id"
        :id="`company-item-${item.id}`"
        :class="isSelectedCompany(item.id) ? 'blue lighten-5' : ''"
        @click="selectCompany(item.id)"
      >
        <v-list-item-content>
          <v-list-item-title>{{ item.name }}</v-list-item-title>

          <v-list-item-subtitle>
            <ul>
              <li>
                <strong>Phone:</strong>
                &nbsp;
                <span>{{ item.phone }}</span>
              </li>
              <li>
                <strong>Country:</strong>
                &nbsp;
                <span>{{ item.country }}</span>
              </li>
              <li>
                <strong>City:</strong>
                &nbsp;
                <span>{{ item.city }}</span>
              </li>
              <li>
                <strong>Street:</strong>
                &nbsp;
                <span>{{ item.street }}</span>
              </li>
              <li>
                <strong>Zip code:</strong>
                &nbsp;
                <span>{{ item.zipcode }}</span>
              </li>
            </ul>
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
    </template>
    <!-- </v-list-item-group> -->
  </v-list>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

export default {
  name: "company-list",

  props: {
    companies: Array,
  },

  computed: mapGetters("company", [
    "getSelectedCompany",
    "isSelectedCompany",
    "getCompanies",
  ]),

  watch: {
    getSelectedCompany(newId, _) {
      const target = document.getElementById(`company-item-${newId}`);
      this.$scrollTo(target, 300, {
        container: "#companies",
      });
    },
  },

  methods: mapActions("company", ["selectCompany"]),
};
</script>

<style scoped>
.list {
  max-height: 80vh;
  overflow-y: scroll;
}

.list li {
  padding-top: 5px;
}
</style>