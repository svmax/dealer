<template>
  <v-app>
    <v-app-bar app>
      <v-toolbar-title>DEALER INDEXER</v-toolbar-title>
    </v-app-bar>

    <v-main>
      <v-container grid-list-md fluid>
        <v-layout wrap>
          <v-flex xs12>
            <router-view />
          </v-flex>
        </v-layout>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: "layout",
};
</script>
