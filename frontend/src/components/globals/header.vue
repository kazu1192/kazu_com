<template lang="pug">
  div
    nav#mainNav.navbar.navbar-expand-lg.navbar-light.fixed-top
      .container
        router-link.navbar-brand(to="/") Start Bootstrap
        button.navbar-toggler.navbar-toggler-right(type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation")
          | Menu
          i.fas.fa-bars
        #navbarResponsive.collapse.navbar-collapse
          ul.navbar-nav.ml-auto
            li.nav-item
              router-link.nav-link(to="/") Home
            li.nav-item
              router-link.nav-link(to="/About") About
            li.nav-item
              router-link.nav-link(to="/Post") Sample Post
            li.nav-item
              router-link.nav-link(to="/Contact") Contact
    header.masthead(style="background-color: skyblue")
      .overlay
      .container
        .row
          .col-lg-8.col-md-10.mx-auto
            .site-heading
              h1 Clean Blog
              span.subheading A Blog Theme by Start Bootstrap
</template>
