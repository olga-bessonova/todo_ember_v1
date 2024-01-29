import Route from '@ember/routing/route'
import { service } from '@ember/service'

export default class ActiveTodos extends Route {
  @service repo

  model() {
    let repo = this.repo

    return {
      get todos() {
        return repo.active
      }
    }
  }
}