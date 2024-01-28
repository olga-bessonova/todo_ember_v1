import Create from './create'

<template>
  <section class="todoapp">
    <header class="header">
      <h1>todos</h1>
      <Create/>
    </header>

    {{!-- {{yield}}
      {{#let (service "repo") as |repo|}}
        {{#if (hasTodos repo.all)}}
          <Footer />
        {{/if}}
      {{/let}} --}}
  </section>
</template>