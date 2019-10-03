<template>
  <div id="mainNav">
    <v-toolbar app fixed clipped-left>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Application</v-toolbar-title>
    </v-toolbar>
  </div>
</template>

<style lang="scss" scoped>
#mainNav {
  font-family: sans-serif;
  .navbar-brand {
    font-weight: 800;
  }
  .navbar-toggler {
    font-size: 12px;
    font-weight: 800;
    padding: 13px;
    text-transform: uppercase;
  }
  .navbar-nav {
    font-size: 12px;
    font-weight: 800;
    letter-spacing: 1px;
    text-transform: uppercase;
  }
}
</style>
