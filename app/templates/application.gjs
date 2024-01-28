import title from 'ember-page-title/helpers/page-title';
import Route from 'ember-route-template';
import Layout from 'todomvc/components/layout';

export default Route(
  <template>
    {{title "EmberTODO"}}

    <Layout>
      {{outlet}}
    </Layout>
  </template>
)