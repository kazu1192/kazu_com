<template lang="pug">
div#mainNav
  b-navbar(toggleable="lg" type="dark" variant="dark")
    .container
      b-navbar-brand(to="/") NavBar
      b-navbar-toggle(target="nav-collapse")
      b-collapse#nav-collapse(is-nav="")
        b-navbar-nav.ml-auto
          router-link.nav-link(to="/") Home
          router-link.nav-link(to="/About") About
          router-link.nav-link(to="/Contact") Contact
</template>

<script>
export default {

}
</script>

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
