<template lang="pug">
nav#mainNav.navbar.navbar-expand-lg.navbar-light.fixed-top
  .container
    router-link.navbar-brand(to="/") Start Bootstrap
    button.navbar-toggler.navbar-toggler-right(type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation")
      | Menu
      i.fas.fa-bars
    #navbarResponsive.collapse.navbar-collapse
      ul.navbar-nav.ml-auto
        li.nav-item.active
          router-link.nav-link(to="/") Home
        li.nav-item
          router-link.nav-link(to="/About") About
        li.nav-item
          router-link.nav-link(to="/Post") Sample Post
        li.nav-item
          router-link.nav-link(to="/Contact") Contact
</template>
