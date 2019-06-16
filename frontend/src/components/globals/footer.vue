<template lang="pug">
  footer
    .container
      .row
        .col-lg-8.col-md-10.mx-auto
          ul.list-inline.text-center
            li.list-inline-item
              router-link(to="#")
                span.fa-stack.fa-lg
                  i.fas.fa-circle.fa-stack-2x
                  i.fab.fa-twitter.fa-stack-1x.fa-inverse
            li.list-inline-item
              router-link(to="#")
                span.fa-stack.fa-lg
                  i.fas.fa-circle.fa-stack-2x
                  i.fab.fa-facebook-f.fa-stack-1x.fa-inverse
            li.list-inline-item
              router-link(to="#")
                span.fa-stack.fa-lg
                  i.fas.fa-circle.fa-stack-2x
                  i.fab.fa-github.fa-stack-1x.fa-inverse
          p.copyright.text-muted Copyright © Your Website 2019
</template>
