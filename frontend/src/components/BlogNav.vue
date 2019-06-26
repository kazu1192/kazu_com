<template lang="pug">
  div#mainNav
    b-navbar(toggleable="lg" type="dark" variant="dark")
      b-navbar-brand(to="/") Kazu Blog
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
